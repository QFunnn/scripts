--[[
     ~ qMCP (deadlock)
     ~ MCP Lua bridge

     ~ author: qfun (qfun_g9s), nie (internetfanat), oO (internetenemy)
]]
local ai_bridge = {}

local a = function(...)
	return ...
end

local cfg = {
	game = "deadlock",

	ip = "127.0.0.1",
	port = 4000,

	poll_interval = 1,
	poll_timeout = 20,

	max_per_frame = 4,
	request_timeout = 5,

	register_timeout = 10,
	register_retry = 2,
}

local state
do
	state = {
		last_poll = 0,
		polling = false,

		registering = false,
		register_started = 0,
		next_register = 0,
		dirty = false,
		revision = 0,

		queue = {},
		tools = {},
		order = {},
	}
end

local dump = a(function(value)
	if type(value) ~= "table" then
		return tostring(value)
	end

	return utils.json_encode(value)
end)

local helpers
do
	helpers = {
		url = a(function(point, query)
			local address = "http://" .. cfg.ip .. ":" .. cfg.port .. "/" .. point

			return query and (address .. "?" .. query) or address
		end),

		log = a(function(level, message, data)
			print("[mcp] level: " .. tostring(level) .. " msg: " .. tostring(message) .. " data: " .. dump(data))

			http.request(helpers.url("add-log"))
				:post()
				:accept_json()
				:json({
					timestamp = os.time(),
					level = level,
					message = message,
					data = data,
				})
				:send_and_forget()
		end),

		poll_commands = a(function(on_done)
			http.request(helpers.url("poll", "game=" .. cfg.game))
				:get()
				:accept_json()
				:timeout(cfg.request_timeout)
				:send(function(status, body, success)
					if not success or status ~= 200 then
						return on_done(nil)
					end

					on_done(utils.json_decode(body))
				end)
		end),

		send_manifest = a(function(manifest, on_done)
			http.request(helpers.url("register"))
				:post()
				:accept_json()
				:json(manifest)
				:timeout(cfg.request_timeout)
				:send(function(status, body, success)
					if not success or status ~= 200 then
						return on_done(nil)
					end

					on_done(utils.json_decode(body))
				end)
		end),

		send_result = a(function(id, ok, result, err, delivered)
			local request = http.request(helpers.url("result")):post():accept_json():json({
				id = id,
				ok = ok,
				result = result,
				error = err,
			})

			if delivered then
				return request:send(delivered)
			end

			request:send_and_forget()
		end),
	}
end

ai_bridge.tool = a(function(name, description, params, handler, opts)
	if not state.tools[name] then
		state.order[#state.order + 1] = name
	end

	state.tools[name] = {
		name = name,
		description = description,
		params = params,
		handler = handler,
		timeout = opts and opts.timeout,
		delivered = opts and opts.delivered,
	}

	state.revision = state.revision + 1
	state.dirty = true
end)

ai_bridge.remove = a(function(name)
	if not state.tools[name] then
		return
	end

	state.tools[name] = nil

	for index, registered in ipairs(state.order) do
		if registered == name then
			table.remove(state.order, index)
			break
		end
	end

	state.revision = state.revision + 1
	state.dirty = true
end)

local core
do
	core = {
		manifest = a(function()
			local tools = {}

			for _, name in ipairs(state.order) do
				local entry = state.tools[name]

				if entry then
					tools[#tools + 1] = {
						name = entry.name,
						description = entry.description,
						params = entry.params,
						timeout = entry.timeout,
					}
				end
			end

			return { game = cfg.game, tools = tools }
		end),

		execute = a(function(command)
			local entry = state.tools[command.method]
			local handler = entry and entry.handler

			if not handler then
				return helpers.send_result(command.id, false, nil, "unknown method: " .. tostring(command.method))
			end

			local result = handler(command.args or {})

			helpers.send_result(command.id, true, result, nil, entry.delivered)
		end),

		sync = a(function()
			local now = os.time()

			if state.registering then
				if now - state.register_started <= cfg.register_timeout then
					return
				end

				state.registering = false
			end

			if not state.dirty or now < state.next_register then
				return
			end

			state.registering = true
			state.register_started = now
			state.next_register = now + cfg.register_retry

			local revision = state.revision

			helpers.send_manifest(core.manifest(), function(body)
				state.registering = false

				if not body or not body.ok then
					return
				end

				if revision == state.revision then
					state.dirty = false
				end

				if body.rejected and #body.rejected > 0 then
					helpers.log("error", "server rejected tools", body.rejected)
				end
			end)
		end),

		poll = a(function()
			local now = os.time()

			if state.polling then
				if now - state.last_poll > cfg.poll_timeout then
					state.polling = false
				end

				return
			end

			if now - state.last_poll < cfg.poll_interval then
				return
			end

			state.last_poll = now
			state.polling = true

			helpers.poll_commands(function(body)
				state.polling = false

				if body then
					if body.registered == false then
						state.dirty = true
					end

					for _, command in ipairs(body.commands or {}) do
						state.queue[#state.queue + 1] = command
					end
				end

				core.sync()
			end)
		end),

		process = a(function()
			for _ = 1, cfg.max_per_frame do
				local command = table.remove(state.queue, 1)
				if not command then
					return
				end

				core.execute(command)
			end
		end),

		run = a(function()
			core.sync()
			core.poll()
			core.process()
		end),
	}
end

local utilities
do
end

ai_bridge.tool(
	"get_entity_list",
	"Returns indexes of the entities on the map. Without a filter returns all of them.",
	{
		{ "class_name", "string?", "filter by entity class, e.g. C_AI_BaseNPC" },
	},
	a(function(args)
		local result = {}
		local entities = args.class_name and entity_list.by_class_name(args.class_name) or entity_list.get_all()

		for _, entity in ipairs(entities) do
			result[#result + 1] = entity:get_index()
		end

		return result
	end)
)

ai_bridge.tool(
	"get_entities_name",
	"Returns names of the specified entities.",
	{
		{ "indexes", "number[]", "array of entity indexes" },
	},
	a(function(args)
		local result = {}

		for _, index in ipairs(args.indexes or {}) do
			local entity = entity_list.by_index(index)
			if not entity then
				return
			end

			result[#result + 1] = {
				index = index,
				name = entity:get_name(),
			}
		end

		return result
	end)
)

ai_bridge.tool(
	"get_entities_position",
	"Returns positions of the specified entities.",
	{
		{ "indexes", "number[]", "array of entity indexes" },
	},
	a(function(args)
		local result = {}

		for _, index in ipairs(args.indexes or {}) do
			local entity = entity_list.by_index(index)
			if not entity then
				return
			end

			local origin = entity:get_origin() or Vector()

			result[#result + 1] = {
				index = index,
				position = {
					x = origin.x,
					y = origin.y,
					z = origin.z,
				},
			}
		end

		return result
	end)
)

ai_bridge.tool(
	"ping",
	"Checks that lua answers: returns current time and tick count.",
	{},
	a(function()
		return { alive = true, time = os.time(), tick = global_vars.tickcount() }
	end)
)

ai_bridge.tool(
	"reload_scripts",
	"Reloads every lua script once this answer reaches the server.",
	{},
	a(function()
		return { reloading = true }
	end),
	{ delivered = a(function()
		print("--- SCRIPTS RELOADED ---")
		utils.reload_scripts()
	end) }
)

global_ctx_t.mcp_log = helpers.log

callback.on_scripts_loaded:set(a(function()
	core.sync()
	print("[mcp] started, tools: " .. #state.order)
end))

callback.on_frame:set(a(function()
	core.run()
end))

return ai_bridge

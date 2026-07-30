--[[
    ~ match info changer • hero stats
    ~ t.me/windguild & spring.ceo
	~ preview: blob: https://i.imgur.com/IX4Pv9s.png
]]

local hero_stats = {}

local a = function(...)
	return ...
end

local cfg = {
	panel_id = "HeroStatsHistoryWinsLosses",
	pages_id = "DashboardPages",
	stats_root = "StatsTabContents",
	class_page = "PageVisible",

	walk_depth = 6, -- читай комент ниже
	walk_limit = 3000, -- читай комент на строчке 114

	class = {
		win = "HistoryWin",
		loss = "HistoryLoss",
	},

	title = {
		block = "HeroStatsFullBlock",
		class = "BlockTitle",
	},

	text = {
		won = "WON MATCH",
		lost = "LOST MATCH",
	},

	captions = {
		["GAMES"] = "games",
		["WINS"] = "wins",
		["LOSSES"] = "losses",
		["WIN RATE"] = "winrate",
		["STREAK (BEST)"] = "streak",
	},
}

local ui, state
do
	local tab = Menu.Create("Scripts", "Hero Stats", "Matches")
	tab:Icon("\u{f201}")

	local page = tab:Create("Main")
	local group = page:Create("Dump")

	ui = {
		page = page,
		dump = group:Button("Dump matches", function()
			hero_stats.dump()
		end),
		status = group:Label("no dump yet"),
	}

	state = {
		matches = {},
		summary = {},
		base = {},
		result_label = nil,
		title = nil,
		children = 0,
	}
end

local helper
do
	helper = {
		text = a(function(panel)
			if not panel:GetPanelType():find("Label") then
				return ""
			end
			return panel:GetText()
		end),

		walk = a(function(root, fn)
			local visited = 0

			local function step(node, depth)
				if depth > cfg.walk_depth or visited > cfg.walk_limit then
					return
				end

				visited = visited + 1
				if fn(node) == false then
					return
				end

				for i = 0, node:GetChildCount() - 1 do
					step(node:GetChild(i), depth + 1)
				end
			end

			step(root, 0)
		end),

		ancestor = a(function(panel, class_name)
			local node = panel:GetParent()
			while node do
				if node:HasClass(class_name) then
					return node
				end
				node = node:GetParent()
			end
		end),

		-- эт хуйню я спиздил из рекрсивного преобразования фурье
		page = a(function()
			local pages = Panorama.GetPanelByName(cfg.pages_id, false)
			if not pages then
				return
			end

			for i = 0, pages:GetChildCount() - 1 do
				local child = pages:GetChild(i)
				if child:HasClass(cfg.class_page) and child:FindChildTraverse(cfg.panel_id) then
					return child
				end
			end
		end),

		context = a(function()
			local page = helper.page()
			if not page then
				return
			end

			local history = page:FindChildTraverse(cfg.panel_id)

			return {
				history = history,
				block = helper.ancestor(history, cfg.title.block),
				stats = page:FindChildTraverse(cfg.stats_root),
			}
		end),

		title = a(function(block)
			local label = block:FindChildWithClass(cfg.title.class)
			return label and helper.text(label)
		end),

		caption_pairs = a(function(root)
			local found = {}

			helper.walk(root, function(node)
				local key = cfg.captions[helper.text(node):upper()]
				if not key or found[key] then
					return
				end

				local parent = node:GetParent()
				for i = 0, parent:GetChildCount() - 1 do
					local sibling = parent:GetChild(i)
					if sibling ~= node and helper.text(sibling):match("%d") then
						found[key] = sibling
						break
					end
				end
			end)

			return found
		end),

		result_label = a(function(root)
			local label

			helper.walk(root, function(node)
				if label then
					return false
				end

				local text = helper.text(node):upper()
				if text == cfg.text.won or text == cfg.text.lost then
					label = node
				end
			end)

			return label
		end),
	}
end

local core
do
	core = {
		collect = a(function(history)
			local slots = {}

			for i = 0, history:GetChildCount() - 1 do
				local child = history:GetChild(i)
				local result = helper.text(child)

				if (result == "W" or result == "L") and child:IsVisible() and child:GetLayoutWidth() > 0 then
					slots[#slots + 1] = {
						position = #slots + 1,
						result = result,
						original = result,
						panel = child,
					}
				end
			end

			return slots
		end),

		items = a(function()
			local items = {}

			for _, slot in ipairs(state.matches) do
				items[#items + 1] = string.format("%d.  %s", slot.position, slot.result)
			end

			return items
		end),

		selected = a(function()
			return state.matches[ui.match:Get() + 1]
		end),

		sync_switch = a(function()
			ui.win:Set(core.selected().result == "W")
		end),

		refresh = a(function(position)
			ui.match:Update(core.items(), position or 0)
			core.sync_switch()
		end),

		write_result = a(function(slot, result)
			local win = result == "W"

			slot.panel:RemoveClasses(win and cfg.class.loss or cfg.class.win)
			slot.panel:AddClasses(win and cfg.class.win or cfg.class.loss)
			slot.panel:SetText(result)
			slot.result = result
		end),

		win_delta = a(function()
			local delta = 0

			for _, slot in ipairs(state.matches) do
				if slot.result ~= slot.original then
					delta = slot.result == "W" and delta + 1 or delta - 1
				end
			end

			return delta
		end),

		streaks = a(function()
			local current, best = 0, 0

			for _, slot in ipairs(state.matches) do
				if slot.result == "W" then
					current = current + 1
					best = math.max(best, current)
				else
					current = 0
				end
			end

			return current, best
		end),

		restore_summary = a(function()
			for key, panel in pairs(state.summary) do
				panel:SetText(state.base[key])
			end
		end),

		sync_summary = a(function()
			local base_wins = tonumber(state.base.wins)
			local base_losses = tonumber(state.base.losses)
			if not base_wins or not base_losses then
				return
			end

			local delta = core.win_delta()
			if delta == 0 then
				core.restore_summary()
				return
			end

			local wins = base_wins + delta
			local losses = base_losses - delta

			state.summary.wins:SetText(tostring(wins))
			state.summary.losses:SetText(tostring(losses))

			if state.summary.winrate and wins + losses > 0 then
				state.summary.winrate:SetText(string.format("%.1f%%", wins / (wins + losses) * 100))
			end

			if state.summary.streak then
				local best = tonumber((state.base.streak or ""):match("%((%d+)%)")) or 0
				local streak, longest = core.streaks()

				state.summary.streak:SetText(string.format("%d (%d)", streak, math.max(best, longest)))
			end
		end),

		create_menu = a(function()
			local group = ui.page:Create("Match")

			ui.group = group
			ui.match = group:Combo("Match", core.items(), 0)
			ui.match:Icon("\u{f0cb}")
			ui.match:SetCallback(a(function()
				core.sync_switch()
			end))

			ui.win = group:Switch("Win", false)
			ui.win:Icon("\u{f091}")

			ui.apply = group:Button("Apply", function()
				hero_stats.apply()
			end)
			ui.apply:Icon("\u{f00c}")

			ui.reset = group:Button("Clear", function()
				hero_stats.reset()
			end, true)
		end),
	}
end

hero_stats.dump = a(function(context)
	context = context or helper.context()
	if not context then
		ui.status:ForceLocalization("stats page not found")
		return
	end

	state.matches = core.collect(context.history)
	state.title = helper.title(context.block)
	state.children = context.history:GetChildCount()
	state.result_label = helper.result_label(context.block)
	state.summary = helper.caption_pairs(context.stats)
	state.base = {}

	for key, panel in pairs(state.summary) do
		state.base[key] = helper.text(panel)
	end

	if #state.matches == 0 then
		ui.status:ForceLocalization("no matches on this page")
		return
	end

	if not ui.match then
		core.create_menu()
	end

	ui.group:Visible(true)
	core.refresh()
	ui.status:ForceLocalization(string.format("successfully dumped %d matches", #state.matches))
end)

hero_stats.apply = a(function()
	local slot = core.selected()
	local result = ui.win:Get() and "W" or "L"

	if state.result_label then
		state.result_label:SetText(result == "W" and cfg.text.won or cfg.text.lost)
	end

	core.write_result(slot, result)
	core.sync_summary()
	core.refresh(slot.position - 1)
end)

hero_stats.reset = a(function()
	for _, slot in ipairs(state.matches) do
		if slot.result ~= slot.original then
			core.write_result(slot, slot.original)
		end
	end

	core.sync_summary()
	core.refresh()
end)

return hero_stats

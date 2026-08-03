--[[
    ~ uc.dumper • uc.zone table hooker
	~ hook methods in tables, can used to dump some logic
	~ showcase: https://youtu.be/k8Zo-M0X4cc, https://youtu.be/pgXEyBUn624, https://youtu.be/jCsamV2ohD4
]]

local a = function(...)
	return ...
end
local old_print = print

local HOOKS = {
	---@note external
	Render = {
		"FilledRect",
		"Rect",
		"RoundedProgressRect",
		"DonutChart",
		"Line",
		"PolyLine",
		"Circle",
		"FilledCircle",
		"CircleGradient",
		"Triangle",
		"FilledTriangle",
		"TexturedPoly",
		"LoadFont",
		"Text",
		"WorldToScreen",
		"ScreenSize",
		"TextSize",
		"LoadImage",
		"LoadSvg",
		"LoadSvgString",
		"Image",
		"ImageCentered",
		"ImageSize",
		"OutlineGradient",
		"Gradient",
		"Shadow",
		"ShadowCircle",
		"ShadowConvexPoly",
		"ShadowNGon",
		"Blur",
		"PushClip",
		"PopClip",
		"StartRotation",
		"StopRotation",
		"SetGlobalAlpha",
		"ResetGlobalAlpha",
		"CenteredNotification",
		"Logo",
		"FindOrCreateRT",
		"MarkDirtyRT",
		"RenderRT",
		"ResizeRT",
	},

	---@note internal
	LIB_RENDER = {
		"font",
		"load_image",

		"centered_notification",

		"is_visible",
		"in_bounds",

		"line",
		"line_arrowed",

		"filled_rect",
		"outline_rect",
		"gradient",
		"glow",
		"blur",

		"triagle",
		"filled_triagle",

		"circle",
		"filled_circle",
		"gradient_circle",
		"glow_circle",

		"clip",
		"pop_clip",

		"image",

		"text_size",
		"text",

		"clone",
		"clone_c",
		"theme",
		"localizer",

		"calculate_value",
		"calculate_value_no_clamp",

		"drag_hitbox",
		"button_hitbox",
	},

	CMenuSliderInt = {
		"Update",

		"Name",
		"Parent",
		"Type",
		"Open",

		"ForceLocalization",

		"ToolTip",

		"Visible",
		"Disabled",
		"Unsafe",

		"Get",
		"Set",

		"Image",
		"ImageHandle",
		"Icon",

		"SetCallback",
		"UnsetCallback",

		"ColorPicker",
		"Gear",
	},

	panorama = {
		"get_panel_by_id",
		"get_panel_by_panel_type",
		"get_panel_by_path",
		"create_panel",
		"sym2string",
	},

	uipanel = {
		"is_valid",
		"get_id",
		"set_id",
		"has_id",
		"get_panel_type",
		"get_parent",
		"find_child",
		"find_child_traverse",
		"find_ancestor",
		"find_child_in_layout_file",
		"find_child_by_path",
		"find_children_with_class_traverse",
		"find_children_with_id_traverse",
		"find_child_with_class",
		"children",
		"get_child_count",
		"get_child",
		"get_first_child",
		"get_last_child",
		"get_child_index",
		"get_actual_layout_width",
		"get_actual_layout_height",
		"set_visible",
		"is_visible",
		"get_class_list",
		"add_class",
		"remove_class",
		"add_classes",
		"remove_classes",
		"has_class",
		"ascendant_has_class",
		"set_has_class",
		"trigger_class",
		"set_draggable",
		"is_draggable",
		"get_attribute_string",
		"set_attribute_string",
		"set_style",
		"apply_styles",
		"remove_and_delete_children",
		"get_text",
		"set_text",
		"get_image_src",
		"get_screen_position",
		"get_bounds",
		"run_script",
		"switch_class",
		"delete_async",
		"load_layout_file",
	},

	NEW_UI_LIB = {
		"create_tab",
		"get_default_group",
	},

	ui_lib_tab = {
		"create",
	},

	ui_lib_group = {
		"switch",
		"slider",
		"combo",
		"multicombo",
		"multiselectable",
		"button",
		"label",
		"colorpicker",
		"input",
		"bind",

		"update",

		"set_callback",
		"unset_callback",

		"visible_condition",
		"disable_condition",

		"link_to_ui_disable_condition",
		"link_to_ui_visible_condition",
	},

	ui_lib_element = {
		"set",
		"tooltip",
		"icon",
		"image",

		"visible",
		"disable",

		"visible_condition",
		"disable_condition",

		"set_callback",
		"unset_callback",

		"link_to_ui_disable_condition",
		"link_to_ui_visible_condition",

		"switch",
		"slider",
		"combo",
		"multicombo",
		"multiselectable",
		"button",
		"label",
		"colorpicker",
		"input",
		"bind",

		"override_gear_name",
		"override_gear_icon",
		"override_gear_size",

		"down_once",
		"down",
		"toggle",
		"set_toggle",

		"list",
	},

	CUserCmd = {
		"add_buttonstate1",
		"add_buttonstate2",
		"add_buttonstate3",
		"clear_buttonstate1",
		"clear_buttonstate2",
		"clear_buttonstate3",
		"get_psilent_camera_pos",
		"can_psilent_at_pos",
		"set_psilent_at_pos",
		"smooth_aim",
		"reset_backtrack",
		"reset_camera_pos",
		"reset_camera_ang",
		"get_orig_button_state0",
		"get_orig_button_state1",
		"get_orig_button_state2",
		"set_input",
	},

	Localizer = {
		"Get",
		"RegToken",
	},

	GameLocalizer = {
		"Find",
	},

	net_channel = {
		-- "latency",
		"send_net_message",
	},

	gc = {
		"send_message",
		"decode_message",
		"decode",
		"register_message",
		"go_get_message_name",
		"get_steam_id",
	},

	http = {
		"request",
	},

	utils = {
		"json_encode",
		"json_decode",
		"reload_scripts",
		"execute_command",
	},
}

local HOOKS_MT = {
	HttpRequestBuilder = {
		"get",
		"post",
		"header",
		"headers",
		"bearer",
		"user_agent",
		"basic_auth",
		"accept_json",
		"json",
		"form",
		"body",
		"query",
		"timeout",
		"connect_timeout",
		"tls_pin",
		"no_revoke",
		"param",
		"send",
		"send_and_forget",
	},
}

local originals = {}

local helpers
do
	helpers = {
		log = a(function(...)
			local out = {}
			for i = 1, select("#", ...) do
				out[#out + 1] = tostring(select(i, ...))
			end
			old_print(" [ uc.dumper ] " .. table.concat(out, " "))
		end),
		describe = a(function(v)
			local t = type(v)

			if t == "string" then
				return string.format("%q", v)
			elseif t == "number" or t == "boolean" then
				return tostring(v)
			elseif t == "userdata" then
				-- Color
				if v.r and v.g and v.b then
					return ("Color(%s,%s,%s,%s)"):format(v.r, v.g, v.b, v.a or 255)
				end

				-- Vector
				if v.x and v.y and v.z then
					return ("Vector(%s,%s,%s)"):format(v.x, v.y, v.z)
				end

				-- Vec2
				if v.x and v.y then
					return ("Vec2(%s,%s)"):format(v.x, v.y)
				end
			end

			if t == "table" then
				local o = {}

				for k, x in pairs(v) do
					o[#o + 1] = helpers.describe(x)
				end

				return "{ " .. table.concat(o, ", ") .. " }"
			end

			return tostring(v)
		end),

		args = a(function(...)
			local o = {}

			for i = 1, select("#", ...) do
				o[i] = helpers.describe(select(i, ...))
			end

			return table.concat(o, ", ")
		end),

		--@note utilities for hook
		hook_http = a(function()
			local builder = http.request("https://127.0.0.1")
			local mt = getmetatable(builder)

			for _, name in ipairs(HOOKS_MT.HttpRequestBuilder) do
				local fn = mt[name]

				if fn then
					mt[name] = function(self, ...)
						helpers.log("  request builder -> " .. name .. "(" .. helpers.args(...) .. ")")

						local ret = fn(self, ...)
						local ret_mt = getmetatable(ret)

						if not ret_mt then
							return
						end

						helpers.hook_builder(ret)

						return ret
					end
				end
			end
		end),

		hook_builder = a(function(builder)
			local mt = getmetatable(builder)

			if mt.__hooked then
				return
			end

			mt.__hooked = true

			for _, name in ipairs(HOOKS_MT.HttpRequestBuilder) do
				local fn = mt[name]

				if fn then
					mt[name] = function(self, ...)
						helpers.log("  request builder -> " .. name .. "(" .. helpers.args(...) .. ")")
						return fn(self, ...)
					end
				end
			end
		end),
	}
end

local core
do
	core = {
		start = a(function()
			helpers.hook_http()
			for object, hooks in pairs(HOOKS) do
				repeat
					local target = _G[object]

					if not target then
						break
					end

					for _, name in ipairs(hooks) do
						local fn = target[name]

						if type(fn) == "function" then
							originals[object] = originals[object] or {}
							originals[object][name] = fn

							target[name] = function(...)
								helpers.log(object .. "." .. name .. "(" .. helpers.args(...) .. ")")
								return fn(...)
							end
						end
					end
				until true
			end

			helpers.log("trace started")
		end),
		stop = a(function()
			for object, hooks in pairs(originals) do
				repeat
					local target = _G[object]

					if not target then
						break
					end

					for name, fn in pairs(hooks) do
						target[name] = fn
					end
				until true
			end

			for k in pairs(originals) do
				originals[k] = nil
			end

			helpers.log("trace stopped")
		end),
	}
end

-- Перфрейм хуйня дабы воровать только 1 кадр рендера
callback.on_frame:set(function()
	if next(originals) then
		core.stop()
	elseif input.is_pressed(Enum.ButtonCode.KEY_MOUSE4) then
		core.start()
	end
end)

-- для всего остального
-- core.start()

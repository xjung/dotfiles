------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

hl.monitor({
	output = "eDP-1",
	mode = "2560x1600@60.0",
	position = "108x1080",
	scale = 1.6,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60.0",
	position = "0x0",
	scale = 1.0,
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = terminal .. " -e yazi"
local menu = "rofi -show drun"
local lock = "hyprlock"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("mpd")

	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GDK_SCALE", "2")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
----- PERMISSIONS -----
-----------------------

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 10,

		border_size = 1,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(000000aa)",
		},

		resize_on_border = true,
		extend_border_grab_area = 15,
		allow_tearing = false,
		layout = "master",
	},

	decoration = {
		rounding = 8,
		rounding_power = 3,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 8,
			passes = 3,
			ignore_opacity = false,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "slave",
	},
})

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,

		-- kitty swallows what it launches (yazi, cli apps) and comes back on exit
		enable_swallow = true,
		swallow_regex = "^(kitty)$",

		-- let mouse movement wake the dpms-off screen (pairs with hypridle)
		mouse_move_enables_dpms = true,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us,ru,de",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
	},
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch exit"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("nautilus"))
-- Toggle floating, and center the window when it lands in floating mode
hl.bind(mainMod .. " + V", function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.window.center())
end)
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("wlogout -p layer-shell"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.swap({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -m active -o ~/Pictures/Screenshots"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window -m active -o ~/Pictures/Screenshots"))
-- Shift+PrtSc: region capture -> swappy for annotation
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd('grim -g "$(slurp)" - | GTK_THEME=Adwaita:dark swappy -f -'))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Pixel resize with mainMod + CTRL + arrows (repeat while held)
local function resize_bind(key, x, y)
	hl.bind(
		mainMod .. " + CTRL + " .. key,
		hl.dsp.window.resize({ x = x, y = y, relative = true }),
		{ repeating = true }
	)
end
resize_bind("right", 50, 0)
resize_bind("left", -50, 0)
resize_bind("up", 0, -50)
resize_bind("down", 0, 50)

-- Master layout controls
hl.bind(mainMod .. " + K", hl.dsp.layout("focusmaster auto"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("swapwithmaster master")) -- xmonad-style promote
hl.bind(mainMod .. " + I", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + O", hl.dsp.layout("removemaster"))
hl.bind(mainMod .. " + ALT + right", hl.dsp.layout("mfact +0.05"), { repeating = true })
hl.bind(mainMod .. " + ALT + left", hl.dsp.layout("mfact -0.05"), { repeating = true })

-- Alt-tab: cycle windows on ALT+TAB, cycle group tabs on SUPER+TAB
hl.bind("ALT + TAB", hl.dsp.window.cycle_next({ next = true }))
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ prev = true }))
hl.bind(mainMod .. " + TAB", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.group.prev())
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())

-- Bounce between the two most recently used workspaces
hl.bind(mainMod .. " + grave", hl.dsp.focus({ workspace = "previous" }))

-- Pin the floating window to all workspaces
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pin())

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- "centered" is not an app class: waybar modules launch TUI dialogs through
-- `kitty --class centered` (bluetui, wlctl) to get a fixed-size floating
-- dialog. Do not remove.
hl.window_rule({
	name = "centered-window",
	match = { class = "centered" },
	float = true,
	min_size = "800 650",
	max_size = "800 650",
})

-- No border when the workspace holds exactly one window (w[tv1] = exactly one
-- tiling window, f[1] = exactly one floating window).
hl.window_rule({
	name = "no-border-single-tiling",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
})

hl.window_rule({
	name = "no-border-single-floating",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
})

-- Frequently used apps live on fixed workspaces. `silent` keeps the focus
-- where it is when e.g. a link opens a new firefox window from another
-- workspace; go there with SUPER+2 when you actually want it.
hl.window_rule({
	name = "firefox-workspace-2",
	match = { class = "firefox" },
	workspace = "2 silent",
})

-- Firefox picture-in-picture is a small floating window, not ws2 material.
-- `unset` cancels the workspace assignment above (last matching rule wins).
hl.window_rule({
	name = "firefox-pip",
	match = { class = "firefox", title = ".*Picture-in-Picture.*" },
	workspace = "unset",
	float = true,
})

hl.window_rule({
	name = "xdg-desktop-portal-gtk-float",
	match = { class = "xdg-desktop-portal-gtk" },
	float = true,
})

----------------
---- LAYERS ----
----------------

-- Frosted glass for mako notifications: blurs whatever sits behind the
-- translucent card so text underneath reads as texture, not as stray words.
hl.layer_rule({
	name = "mako-blur",
	match = { namespace = "^notifications$" },
	blur = true,
	ignore_alpha = 0.2,
})

-- rofi is translucent for the same reason and needs the same treatment.
hl.layer_rule({
	name = "rofi-blur",
	match = { namespace = "^rofi$" },
	blur = true,
	ignore_alpha = 0.2,
})

-- wlogout names its surface "logout_dialog", not "wlogout".
hl.layer_rule({
	name = "wlogout-blur",
	match = { namespace = "^logout_dialog$" },
	blur = true,
	ignore_alpha = 0.2,
})

-- waybar's islands are translucent for the same reason. Without this the
-- wallpaper reads straight through them and the grey module text loses its
-- contrast over a busy photo.
hl.layer_rule({
	name = "waybar-blur",
	match = { namespace = "^waybar$" },
	blur = true,
	ignore_alpha = 0.2,
})

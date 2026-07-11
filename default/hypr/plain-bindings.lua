require("default.hypr.bindings.media")
require("default.hypr.bindings.clipboard")
require("default.hypr.bindings.tiling-v2")
require("default.hypr.bindings.utilities")

-- Application bindings without ANARCHY's preinstalled web apps, TUIs, or desktop apps.
o.bind("SUPER + RETURN", "Terminal", { anarchy = "terminal" })
o.bind("SUPER + SHIFT + RETURN", "Browser", { anarchy = "browser" })
o.bind("SUPER + SHIFT + F", "File manager", { anarchy = "nautilus" })
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", { anarchy = "nautilus-cwd" })
o.bind("SUPER + SHIFT + B", "Browser", { anarchy = "browser" })
o.bind("SUPER + SHIFT + ALT + B", "Browser (private)", { anarchy = "browser --private" })
o.bind("SUPER + SHIFT + N", "Editor", { anarchy = "editor" })

-- Volume, brightness, keyboard backlight, and touchpad controls.
o.bind("XF86AudioRaiseVolume", "Volume up", "anarchy-swayosd-client --output-volume raise",
  { locked = true, repeating = true })
o.bind("XF86AudioLowerVolume", "Volume down", "anarchy-swayosd-client --output-volume lower",
  { locked = true, repeating = true })
o.bind("XF86AudioMute", "Mute", "anarchy-swayosd-client --output-volume mute-toggle", { locked = true, repeating = true })
o.bind("XF86AudioMicMute", "Mute microphone", "anarchy-audio-input-mute", { locked = true, repeating = true })
o.bind("XF86MonBrightnessUp", "Brightness up", "anarchy-brightness-display +5%", { locked = true, repeating = true })
o.bind("XF86MonBrightnessDown", "Brightness down", "anarchy-brightness-display 5%-", { locked = true, repeating = true })
o.bind("SHIFT + XF86MonBrightnessUp", "Brightness maximum", "anarchy-brightness-display 100%",
  { locked = true, repeating = true })
o.bind("SHIFT + XF86MonBrightnessDown", "Brightness minimum", "anarchy-brightness-display 1%",
  { locked = true, repeating = true })
o.bind("XF86KbdBrightnessUp", "Keyboard brightness up", "anarchy-brightness-keyboard up",
  { locked = true, repeating = true })
o.bind("XF86KbdBrightnessDown", "Keyboard brightness down", "anarchy-brightness-keyboard down",
  { locked = true, repeating = true })
o.bind("XF86KbdLightOnOff", "Keyboard backlight cycle", "anarchy-brightness-keyboard cycle", { locked = true })
o.bind("XF86TouchpadToggle", "Toggle touchpad", "anarchy-toggle-touchpad", { locked = true })
o.bind("XF86TouchpadOn", "Enable touchpad", "anarchy-toggle-touchpad on", { locked = true })
o.bind("XF86TouchpadOff", "Disable touchpad", "anarchy-toggle-touchpad off", { locked = true })

-- Precise volume and brightness controls.
o.bind("ALT + XF86AudioRaiseVolume", "Volume up precise", "anarchy-swayosd-client --output-volume +1",
  { locked = true, repeating = true })
o.bind("ALT + XF86AudioLowerVolume", "Volume down precise", "anarchy-swayosd-client --output-volume -1",
  { locked = true, repeating = true })
o.bind("ALT + XF86MonBrightnessUp", "Brightness up precise", "anarchy-brightness-display +1%",
  { locked = true, repeating = true })
o.bind("ALT + XF86MonBrightnessDown", "Brightness down precise", "anarchy-brightness-display 1%-",
  { locked = true, repeating = true })

-- Media controls.
o.bind("XF86AudioNext", "Next track", "anarchy-swayosd-client --playerctl next", { locked = true })
o.bind("XF86AudioPause", "Pause", "anarchy-swayosd-client --playerctl play-pause", { locked = true })
o.bind("XF86AudioPlay", "Play", "anarchy-swayosd-client --playerctl play-pause", { locked = true })
o.bind("XF86AudioPrev", "Previous track", "anarchy-swayosd-client --playerctl previous", { locked = true })

o.bind("SUPER + XF86AudioMute", "Switch audio output", "anarchy-audio-output-switch", { locked = true })

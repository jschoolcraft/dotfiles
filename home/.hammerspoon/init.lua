local reloader = require 'reloader'

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

-- Screens
local main_monitor = "SE39UY04"
local left_monitor = "SyncMaster"
local right_monitor = "SyncMaster"

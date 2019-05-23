meh = {"ctrl", "alt", "shift"}
hyper = {"ctrl", "alt", "cmd", "shift"}

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true

Install=spoon.SpoonInstall

Install:andUse("ReloadConfiguration",
{
  config = {
    watch_paths = "~/code/dotfiles/home/.hammerspoon/"
  },
  hotkeys = {
    reloadConfiguration = {hyper, "r"}
  }
}
)

-- if this doesn't work, next to try:
-- http://www.hammerspoon.org/Spoons/WinWin.html
Install:andUse("MiroWindowsManager",
{
  config = {
    fullScreenSizes = {1, 4/3, 2},
    sizes = {2, 3, 3/2},
    GRID = {w = 24, h = 24}
  },
  hotkeys = {
    up = {hyper, "k"},
    right = {hyper, "l"},
    down = {hyper, "j"},
    left = {hyper, "h"},
    fullscreen = {hyper, "f"},
  }
}
)

Install:andUse("WindowScreenLeftAndRight",
{
  hotkeys = {
    screen_left = { hyper, "y" },
    screen_right= { hyper, "o" },
 }
}
)

hs.hotkey.bind(hyper, "8", function()
  local win = hs.window.focusedWindow()
  hs.alert.show(hs.inspect(win:size()))
  win:setSize(1920,1080)
end)

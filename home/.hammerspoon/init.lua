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

myGrid = { w = 6, h = 4 }
Install:andUse("MiroWindowsManager",
{
  config = {
    fullScreenSizes = {1, 4/3, 2},
    sizes = {2, 3, 3/2},
    GRID = myGrid
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

Install:andUse("WindowGrid",
{
  config = { gridGeometries = { { myGrid.w .."x" .. myGrid.h } } },
  hotkeys = {show_grid = {hyper, "g"}},
  start = true
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

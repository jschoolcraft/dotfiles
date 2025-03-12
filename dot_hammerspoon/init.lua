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

myGrid = { w = 8, h = 3 }
Install:andUse("MiroWindowsManager",
{
  config = {
    -- full screen sizes 1/1, 3/4, 1/2
    fullScreenSizes = {1, 4/3, 2},
    -- sizes 1/2, 1/4, 3/4
    sizes = {2, 4, 4/3},
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
  if not win then return end

  local screen = win:screen()
  local screenFrame = screen:frame()

  local newWidth = 1920
  local newHeight = 1080
  local newX = screenFrame.x + (screenFrame.w - newWidth) / 2
  local newY = screenFrame.y + (screenFrame.h - newHeight) / 2

  hs.alert.show(hs.inspect(win:size()))
  win:setFrame({x = newX, y = newY, w = newWidth, h = newHeight})
end)

local leftScreen = hs.screen('KA272U %(1%)')
local mainScreen = hs.screen('KA272U %(3%)')
local rightScreen = hs.screen('KA272U %(2%)')

local base_layout = {
  {"Messages", nil, rightScreen, nil, nil, nil},
  {"Logseq", nil, rightScreen, hs.geometry.rect(.14, .11, .666, .75), nil, nil},
  {"Obsidian", nil, rightScreen, hs.geometry.rect(.15, .125, .666, .75), nil, nil},
  {"Discord", nil, rightScreen, hs.geometry.rect(.16, .13, .666, .75), nil, nil},
  {"Slack", nil, rightScreen, hs.geometry.rect(.17, .14, .666, .75), nil, nil},
  {"Kitty", nil, mainScreen, hs.layout.right50, nil, nil},
  {"Brave", nil, mainScreen, hs.layout.left75, nil, nil},
}

hs.hotkey.bind(hyper, "1", function()
  hs.layout.apply(base_layout)
end)


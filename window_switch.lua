-- use [Option+W] to switch window between different screen
hs.hotkey.bind({'option'}, 'W', function()
-- get the focused window
local win = hs.window.focusedWindow()
-- get the screen where the focused window is displayed, a.k.a. current screen
local screen = win:screen()
-- compute the unitRect of the focused window relative to the current screen
-- and move the window to the next screen setting the same unitRect
win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0.1)
end)


hs.hotkey.bind('alt', 'tab', 'Next window', hs.window.switcher.nextWindow)

function throwLeft ()
   local win = hs.window.focusedWindow()
   -- 第一个false代表不调整大小，按比例计算
   win:moveOneScreenWest(false, true, 0.1)
end

function throwRight ()
   local win = hs.window.focusedWindow()
   win:moveOneScreenEast(false, true, 0.1)
end

function maximizeWindow ()
    local win = hs.window.focusedWindow()
    hs.grid.maximizeWindow(win)
end

function centerOnScreen ()
    local win = hs.window.focusedWindow()
    local screen = hs.window.focusedWindow():screen()
    win:centerOnScreen(screen)
end

function Cell(x, y, w, h)
    return hs.geometry(x, y, w, h)
end

function leftHalf ()
    local win = hs.window.focusedWindow()
    local screen = hs.window.focusedWindow():screen()
    screenGrid = hs.grid.getGrid(screen)
    local cell = Cell(0, 0, 0.5 * screenGrid.w, screenGrid.h)
    hs.grid.set(win, cell, screen)
end

function rightHalf ()
    local win = hs.window.focusedWindow()
    local screen = hs.window.focusedWindow():screen()
    screenGrid = hs.grid.getGrid(screen)
    local cell = Cell(0.5 * screenGrid.w, 0, 0.5 * screenGrid.w, screenGrid.h)
    hs.grid.set(win, cell, screen)
end

function topHalf ()
    local win = hs.window.focusedWindow()
    local screen = hs.window.focusedWindow():screen()
    screenGrid = hs.grid.getGrid(screen)
    local cell = Cell(0, 0, screenGrid.w, 0.5 * screenGrid.h)
    hs.grid.set(win, cell, screen)
end

function bottomHalf ()
    local win = hs.window.focusedWindow()
    local screen = hs.window.focusedWindow():screen()
    screenGrid = hs.grid.getGrid(screen)
    local cell = Cell(0, 0.5 * screenGrid.h, screenGrid.w, 0.5 * screenGrid.h)
    hs.grid.set(win, cell, screen)
end


hs.hotkey.bind({"ctrl","alt"}, "left", throwLeft)
hs.hotkey.bind({"ctrl","alt"}, "right", throwRight)
hs.hotkey.bind({"ctrl","alt","cmd"}, "m", maximizeWindow)
hs.hotkey.bind({"ctrl","alt","cmd"}, "c", centerOnScreen)
hs.hotkey.bind({"ctrl","alt","cmd"}, "left", leftHalf)
hs.hotkey.bind({"ctrl","alt","cmd"}, "right", rightHalf)
hs.hotkey.bind({"ctrl","alt","cmd"}, "up", topHalf)
hs.hotkey.bind({"ctrl","alt","cmd"}, "down", bottomHalf)
-- use [Option+Q] to switch mouse between different screen

hs.hotkey.bind({'option'}, 'Q', function()
    local screen = hs.mouse.getCurrentScreen()
    local nextScreen = screen:next()
    local rect = nextScreen:fullFrame()
    local center = hs.geometry.rectMidPoint(rect)
    hs.mouse.absolutePosition(center)
	mouseHighlight()
	hs.eventtap.leftClick(center)
end)

-- hs.hotkey.bind({'option'}, 'A', function()
--    local screen = hs.mouse.getCurrentScreen()
--    local rect = screen:fullFrame()
--    local center = hs.geometry.rectMidPoint(rect)
--    hs.mouse.absolutePosition(center)
-- end)



mouseCircle = nil
mouseCircleTimer = nil

function mouseHighlight()
	-- Delete an existing highlight if it exists
	if mouseCircle then
		mouseCircle:delete()
		if mouseCircleTimer then
			mouseCircleTimer:stop()
		end
	end
	-- Get the current co-ordinates of the mouse pointer
	mousepoint = hs.mouse.absolutePosition()
	-- Prepare a big red circle around the mouse pointer
	mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
	mouseCircle:setStrokeColor({["red"]=0.9,["blue"]=0.2,["green"]=0.2,["alpha"]=0.6})
	mouseCircle:setFill(false)
	mouseCircle:setStrokeWidth(5)
	mouseCircle:show()

	-- Set a timer to delete the circle after 1 second
	mouseCircleTimer = hs.timer.doAfter(1, function()
		mouseCircle:delete()
		mouseCircle = nil
	end)
end
hs.hotkey.bind({'option'}, "A", mouseHighlight)

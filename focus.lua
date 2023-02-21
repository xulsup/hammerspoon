-- Setup --
local mash = {"option","shift"}

-- Global keyboard shortcuts --
-- hs.hotkey.bind(mash, 'G', function() hs.application.launchOrFocus('Google Chrome') end)
hs.hotkey.bind(mash, 'F', function() hs.application.launchOrFocus('Firefox') end)
hs.hotkey.bind(mash, 'T', function() hs.application.launchOrFocus('iTerm') end)
hs.hotkey.bind(mash, 'V', function() hs.application.launchOrFocus('Visual Studio Code') end)

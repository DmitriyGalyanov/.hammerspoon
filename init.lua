-- SPOTIFY
-- Spotify pause/play
hs.hotkey.bind({"shift", "ctrl"}, "Up", function()
  hs.spotify.playpause()
end)
-- Spotify next track
hs.hotkey.bind({"shift", "ctrl"}, "Right", function()
  hs.spotify.next()
end)
-- Spotify previous track
hs.hotkey.bind({"shift", "ctrl"}, "Left", function()
  hs.spotify.previous()
end)
-- Spotify fast forward 5 seconds
hs.hotkey.bind({"shift", "ctrl"}, "pageup", function()
  hs.spotify.ff()
end)
-- Spotify backward 5 seconds
hs.hotkey.bind({"shift", "ctrl"}, "pagedown", function()
  hs.spotify.rw()
end)
-- Spotify show current track
hs.hotkey.bind({"shift", "ctrl"}, "Down", function()
  hs.spotify.displayCurrentTrack()
end)

-- WINDOW MANAGEMENT (tiling)
-- move window to RIGHT HALF of screen with
-- WIDTH = SCREEN_WIDTH / 2
-- and HEIGHT = SCREEN_HEIGHT / 2
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local window = hs.window.focusedWindow()
  local f = window:frame()
  local screen = window:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  window:setFrame(f)
end)
-- move window to LEFT HALF of screen with
-- WIDTH = SCREEN_WIDTH / 2
-- and HEIGHT = SCREEN_HEIGHT / 2
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local window = hs.window.focusedWindow()
  local f = window:frame()
  local screen = window:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  window:setFrame(f)
end)
-- change window width [LEFT]
hs.hotkey.bind({"cmd", "ctrl"}, "Left", function()
  local window = hs.window.focusedWindow()
  local f = window:frame()
  local screen = window:screen()
  local max = screen:frame()
  -- if placed in the LEFT PART of screen -- shrinks to left
  if f.x == max.x then
    if (f.w - 1 >= max.w / 3 * 2) then
      f.w = max.w / 3 * 2
    elseif (f.w - 1 >= max.w / 2) then
      f.w = max.w / 2
    elseif (f.w >= max.w / 2) then
      f.w = max.w / 3
    elseif (f.w >= max.w / 3) then
      f.w = max.w / 3
    end
  end
  -- if placed in the RIGHT PART of screen -- expands to left
  if f.x > 3 then
    if (f.w + 1 <= max.w / 3) then
      f.w = max.w / 3
      f.x = max.w / 3 * 2
    elseif (f.w + 1 < max.w / 2) then
      f.w = max.w / 2
      f.x = max.w / 2
    elseif (f.w < max.w / 3 * 2) then
      f.w = max.w / 3 * 2
      f.x = max.w / 3
    end
  end
  window:setFrame(f)
end)
-- change window width [RIGHT]
hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
  local window = hs.window.focusedWindow()
  local f = window:frame()
  local screen = window:screen()
  local max = screen:frame()
  -- if placed in the LEFT CORNER of screen -- expands to right
  if f.x == max.x then
    if (f.w + 1 <= max.w / 3) then
      f.w = max.w / 3
    elseif (f.w + 1<= max.w / 2) then
      f.w = max.w / 2
    elseif (f.w + 1<= max.w / 3 * 2) then
      f.w = max.w / 3 * 2
    end
  end
  -- if placed in the RIGHT PART of screen -- shrinks to right
  if f.x > 3 then
    if (f.w - 1 >= max.w / 3 * 2) then
      f.w = max.w / 3 * 2
      f.x = max.w / 3
    elseif (f.w - 1 >= max.w / 2) then
      f.w = max.w / 2
      f.x = max.w / 2
    elseif (f.w - 1 >= max.w / 2) then
      f.w = max.w / 3
      f.x = max.w / 3 * 2
    elseif (f.w >= max.w / 3) then
      f.w = max.w / 3
      f.x = max.w / 3 * 2
    end
  end
  window:setFrame(f)
end)
-- move window to TOP HALF of screen with
-- HEIGHT = SCREEN_HEIGHT / 2
hs.hotkey.bind({"cmd", "ctrl"}, 'Up', function()
  local window = hs.window.focusedWindow()
  local f = window:frame()
  local screen = window:screen()
  local max = screen:frame()
  f.y = max.y
  f.h = max.h / 2
  window:setFrame(f)
end)
-- move window to BOTTOM HALF of screen with
-- HEIGHT = SCREEN_HEIGHT / 2
hs.hotkey.bind({"cmd", "ctrl"}, 'Down', function()
  local window = hs.window.focusedWindow()
  local f = window:frame()
  local screen = window:screen()
  local max = screen:frame()
	f.y = max.y + (max.h / 2)
  f.h = max.h / 2
  window:setFrame(f)
end)
-- move window to NEXT screen (retaining its relative position and size)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'pageup', function()
	hs.window.focusedWindow():moveOneScreenEast()
end)
-- move window to PREVIOUS screen (retaining its relative position and size)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'pagedown', function()
	hs.window.focusedWindow():moveOneScreenWest()
end)
-- toggle window FULL screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'home', function()
	hs.window.focusedWindow():toggleZoom()
end)
-- MAXIMIZE window
hs.hotkey.bind({"cmd", "ctrl"}, 'end', function()
	local window = hs.window.focusedWindow()
	local f = window:frame()
	local screen = window:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h
	window:setFrame(f)
end)
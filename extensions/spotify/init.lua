--- === hs.spotify ===
---
--- Controls for Spotify music player

local spotify = {}

local alert = require "hs.alert"
local as = require "hs.applescript"

-- Internal function to pass a command to Applescript.
local function tell(cmd)
  local _cmd = 'tell application "Spotify" to ' .. cmd
  local ok, result = as.applescript(_cmd)
  if ok then
    return result
  else
    return nil
  end
end

--- hs.spotify.play()
--- Function
--- Toggles play/pause of current spotify track
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function spotify.play()
  tell('playpause')
end

--- hs.spotify.pause()
--- Function
--- Pauses of current spotify track
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function spotify.pause()
  tell('pause')
end

--- hs.spotify.next()
--- Function
--- Skips to the next spotify track
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function spotify.next()
  tell('next track')
end

--- hs.spotify.previous()
--- Function
--- Skips to previous spotify track
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function spotify.previous()
  tell('previous track')
end

--- hs.spotify.displayCurrentTrack()
--- Function
--- Displays information for current track on screen
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function spotify.displayCurrentTrack()
  local artist = tell('artist of the current track') or "Unknown artist"
  local album  = tell('album of the current track') or "Unknown album"
  local track  = tell('name of the current track') or "Unknown track"
  alert.show(track .."\n".. album .."\n".. artist, 1.75)
end

--- hs.spotify.getCurrentArtist()
--- Function
--- Gets the name of the artist of the current track
---
--- Parameters:
---  * None
---
--- Returns:
---  * A string containing the Artist of the current track
function spotify.getCurrentArtist()
    return tell('artist of the current track')
end

--- hs.spotify.getCurrentAlbum()
--- Function
--- Gets the name of the album of the current track
---
--- Parameters:
---  * None
---
--- Returns:
---  * A string containing the Album of the current track
function spotify.getCurrentAlbum()
    return tell('album of the current track')
end

--- hs.spotify.getCurrentTrack()
--- Function
--- Gets the name of the current track
---
--- Parameters:
---  * None
---
--- Returns:
---  * A string containing the name of the current track
function spotify.getCurrentTrack()
    return tell('name of the current track')
end

return spotify

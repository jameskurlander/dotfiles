#!/bin/bash

playback_info=$(spotify_player get key playback)

if [ -n "$playback_info" ]; then
  artist=$(echo "$playback_info" |
    jq -r '.item.artists[0].name')
  album=$(echo "$playback_info" |
    jq -r '.item.album.name')
  year=$(echo "$playback_info" |
    jq -r '.item.album.release_date' |
    cut -d '-' -f 1)
  song=$(echo "$playback_info" |
    jq -r '.item.name')
  is_playing=$(echo "$playback_info" |
    jq -r '.is_playing')
  repeat_state=$(echo "$playback_info" |
    jq -r '.repeat_state')

  if [ "$song" = "null" ]; then
    echo "No music! (┘◉Д◉)┘ 彡 ┻━┻"
  else
    echo "$artist - $album ($year) - $song"
  fi
fi

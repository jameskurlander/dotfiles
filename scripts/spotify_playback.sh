#!/bin/bash

playback_info=$(spotify_player get key playback)

if [ -n "$playback_info" ]; then
  symbol=''
  shuffle_state=$(echo "$playback_info" |
    jq -r '.shuffle_state')
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

  if [ "$is_playing" = "true" ]; then
    if [ "$shuffle_state" = true ]; then
      symbol='▶'
    else
      symbol='▷'
    fi
  else
    symbol='■'
  fi

  echo "$symbol $artist - $album ($year) - $song"
fi

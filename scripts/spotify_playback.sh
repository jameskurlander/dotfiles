#!/bin/bash

playback_info=$(spotify_player get key playback)
status_line=""

if [ -n "$playback_info" ]; then
  artist_name=$(echo "$playback_info" | jq -r '.item.artists[0].name')
  song_name=$(echo "$playback_info" | jq -r '.item.name')

  if [ "$song_name" = "null" ]; then
    exit 0
  fi

  is_playing=$(echo "$playback_info" | jq -r '.is_playing')
  shuffle_state=$(echo "$playback_info" | jq -r '.shuffle_state')
  repeat_state=$(echo "$playback_info" | jq -r '.repeat_state')

  progress_ms=$(echo "$playback_info" | jq -r '.progress_ms')
  duration_ms=$(echo "$playback_info" | jq -r '.item.duration_ms')

  progress_min=$((progress_ms / 60000))
  progress_sec=$(( (progress_ms / 1000) % 60))
  duration_min=$((duration_ms / 60000))
  duration_sec=$(( (duration_ms / 1000) % 60))

  progress_formatted=$(printf "%d:%02d" $progress_min $progress_sec)
  duration_formatted=$(printf "%d:%02d" $duration_min $duration_sec)

  # if [ "$repeat_state" = "track" ]; then
  #   status_line+="↺T "
  # elif [ "$repeat_state" = "context" ]; then
  #   status_line+="↺C "
  # fi

  if [ "$is_playing" = "true" ]; then
    if [ "$shuffle_state" = true ]; then
      status_line+="▶ "
    else
      status_line+="▷ "
    fi
  else
    status_line+="⏸ "
  fi

  status_line+="$artist_name - $song_name [$progress_formatted/$duration_formatted]"

  echo "$status_line"
fi

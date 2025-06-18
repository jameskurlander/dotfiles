#!/bin/bash

playback_info=$(spotify_player get key playback)

if [ -n "$playback_info" ]; then
  progress_ms=$(echo "$playback_info" | jq -r '.progress_ms')
  progress_min=$((progress_ms / 60000))
  progress_sec=$(( (progress_ms / 1000) % 60))

  duration_ms=$(echo "$playback_info" | jq -r '.item.duration_ms')
  duration_min=$((duration_ms / 60000))
  duration_sec=$(( (duration_ms / 1000) % 60))

  progress_formatted=$(printf "%d:%02d" $progress_min $progress_sec)
  duration_formatted=$(printf "%d:%02d" $duration_min $duration_sec)

  echo "$progress_formatted / $duration_formatted"
fi

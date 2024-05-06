#!/bin/bash

# Set the output directory (current directory + "/output")
OUTPUT_DIR="${PWD}/output"

# Create the output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Loop through all video files in the current directory
for file in *.mp4 *.mkv *.avi *.mov *.wmv; do
  # Get the file name without extension
  filename="${file%.*}"

  # Compress the video file using ffmpeg
  ffmpeg -i "${file}" -c:v libx264 -crf 26 "${OUTPUT_DIR}/${filename}.mp4"
done

#!/bin/bash

# Set the output directory (current directory + "/output")
OUTPUT_DIR="${PWD}/output"

# Create the output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Loop through all video files in the current directory
for file in *.mp4 *.mkv *.avi *.mov *.wmv *.MP4 *.MOV *.m4v *.mpg; do
  # Get the file name without extension
  filename="${file%.*}"

  # Set the CRF value
  CRF_VALUE=26
  
  ffmpeg -i "${file}" -c:v libx264 -crf ${CRF_VALUE} -r 30 "${OUTPUT_DIR}/${filename}_batch_${CRF_VALUE}.mp4"

done

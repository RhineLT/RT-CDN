#!/bin/bash

# Set the output directory (current directory + "/output")
OUTPUT_DIR="${PWD}/output"

# Create the output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Loop through all video files in the current directory
for file in *.mp4 *.MP4 *.mkv *.MKV *.avi *.AVI *.mov *.MOV *.wmv *.WMV *.m4v *.M4V *.mpg *.MPG *.mpeg *.MPEG *.flv *.FLV *.webm *.WEBM *.3gp *.3GP *.ts *.TS; do
  # Check if the file exists (in case no files match the pattern)
  if [[ -f "$file" ]]; then
    # Get the file name without extension
    filename="${file%.*}"

    # Set the CRF value
    CRF_VALUE=26

    # Run ffmpeg to convert the video
    ffmpeg -i "${file}" -c:v libx264 -crf ${CRF_VALUE} -r 30 "${OUTPUT_DIR}/${filename}_batch_${CRF_VALUE}.mp4"
  fi
done

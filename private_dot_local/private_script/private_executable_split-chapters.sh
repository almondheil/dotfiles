#!/bin/sh -efu

if [ "$#" -ne 1 ]; then
  echo "Usage: $(basename $0) <filename>"
  exit 1
fi

input="$1"

if [ ! -f $input ]; then
  echo "Input must be a file"
  exit 1
fi

# actual functionality from https://stackoverflow.com/a/53553938

ffprobe \
    -print_format csv \
    -show_chapters \
    "$input" |
cut -d ',' -f '5,7,8' |
while IFS=, read start end chapter
do
    ffmpeg \
        -nostdin \
        -ss "$start" -to "$end" \
        -i "$input" \
        -c copy \
        -map 0 \
        -map_chapters -1 \
        "${input%.*}-$chapter.${input##*.}"
done

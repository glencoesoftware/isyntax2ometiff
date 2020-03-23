#!/bin/bash
FILE=/gs/$1
if [ -f "$FILE" ]; then
  echo "File found, starting conversion"
  isyntax2raw write_tiles /gs/$1 /gs/$1_tmp
  raw2ometiff /gs/$1_tmp /gs/$1.ome.tiff
  rm -rf /gs/$1_tmp
else
  echo "$FILE not found, try again"
fi

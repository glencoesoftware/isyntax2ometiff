#!/bin/bash

while getopts ":h:w:r:f:c:i:l:b" opt
do
        case "${opt}" in
        h)
           TILEHEIGHT="--tile_height ${OPTARG}"
        ;;
        w)
           TILEWIDTH="--tile_width ${OPTARG}"
        ;;
        r)
           RESOLUTIONS="--resolutions ${OPTARG}"
        ;;
        f)
           FILE_TYPE="--file_type ${OPTARG}"
        ;;
        c)
           COMPRESSION="--compression=${OPTARG}"
        ;;
        b)
           RGB="--rgb"
        ;;
        l)
           LEGACY="--legacy"
        ;;
        i)
           FILE="/gs/${OPTARG}"
        ;;
        :)
           echo "Invalid option: $OPTARG requires an argument"
        ;;
        esac
        ISYNTAX_ARGS="$TILEHEIGHT $TILEWIDTH $RESOLUTIONS $FILE_TYPE"
        FILE="$FILE"
done
if [ -f "$FILE" ]; then
  set -x
  echo "$FILE found, starting conversion"
  isyntax2raw write_tiles $ISYNTAX_ARGS $FILE $FILE.tmp
  raw2ometiff $COMPRESSION $LEGACY $RGB $FILE.tmp $FILE.ome.tiff
  echo "$COMPRESSION"
  rm -rf $FILE.tmp
else
  echo "$FILE not found, try again"
fi

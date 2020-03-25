#!/bin/bash -x

#get options and build commands
while getopts ":h:w:r:f:c:i:l" opt
do
        case "${opt}" in
        h)
           TILEHEIGHT=${OPTARG}
           HEIGHT_ARG=" --tile_height $TILEHEIGHT"
        ;;
        w)
           TILEWIDTH=${OPTARG}
           WIDTH_ARG=" --tile_width $TILEWIDTH"
        ;;
        r)
           RESOLUTIONS=${OPTARG}
           RES_ARG=" --resolutions $RESOLUTIONS"
        ;;
        f)
           FILE_TYPE=${OPTARG}
           FILE_TYPE_ARG=" --file_type $FILE_TYPE"
        ;;
        c)
           COMPRESSION=${OPTARG}
           COMP_ARG=" --compression=$COMPRESSION"
        ;;
        l)
           LEGACY=" --legacy"
        ;;
        i)
           FILE="/gs/${OPTARG}"
        ;;
        :)
           echo "Invalid option: $OPTARG requires an argument"
        ;;
        esac
        ISYNTAX_ARGS="$HEIGHT_ARG$WIDTH_ARG$RES_ARG$FILE_TYPE_ARG"
        RAW_ARGS="$COMP_ARG$LEGACY"
        FILE="$FILE"
done
echo "ISYNTAX OPTS: $ISYNTAX_ARGS"
echo "RAW OPTS: $RAW_ARGS"
echo "$FILE"

if [ -f "$FILE" ]; then
  echo "File found, starting conversion"
  isyntax2raw write_tiles $ISYNTAX_ARGS $FILE $FILE.tmp
  raw2ometiff $RAW_ARGS $FILE.tmp $FILE.ome.tiff
  rm -rf $FILE.tmp
else
  echo "$FILE not found, try again"
fi

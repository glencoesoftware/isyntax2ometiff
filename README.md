iSyntax2ometiff docker
======================

A docker container for converting Philips iSyntax files into the ome.tiff format.

Prerequisites
=============

Clone the repo and add the following files to the directory before building the docker:

isyntax2raw .whl file - https://github.com/glencoesoftware/isyntax2raw/releases

raw2ometiff .zip file - https://github.com/glencoesoftware/raw2ometiff/releases

PhilipsSDK - https://www.openpathology.philips.com/

Building the docker
===================

docker image build -t isyntax2ometiff .

Converting an iSyntax file
==========================

docker run --rm -v /currentworkingdirectory:/gs isyntax2ometiff -i 1.isyntax

Substitue "/currentworkingdirectory" for your working directory - this will map your working directory to the /gs directory within the docker container.

Options
=======

-i input file

-h tile height in pixels [default: 512]

-w tile width in pixels [default: 512]

-r number of pyramid resolutions to generate [default: all]

-f tile file extension (jpg, png, tiff, n5, zarr) [default: n5]

-c Compression type for output OME-TIFF file (Uncompressed, LZW, JPEG-2000, JPEG-2000 Lossy, JPEG, zlib) [default: LZW]

-l Legacy, writes a Bio_Formats 5.9.x pyramid instead of OME-TIFF

Prerequisites
=============

The following should be present in the working directory before building the docker:

isyntax2raw .whl file - https://github.com/glencoesoftware/isyntax2raw/releases

raw2ometiff .zip file - https://github.com/glencoesoftware/raw2ometiff/releases

PhilipsSDK - https://www.openpathology.philips.com/

Building the docker
===================

docker image build -t isyntax2tiff .

Running the docker
==================

docker run --rm -v /opt/isyntax2tiff:/gs isyntax2tiff 1.isyntax

isyntax2ometiff docker
======================

A docker container for converting Philips iSyntax files into the .ome.tiff format.

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

docker run --rm -v /currentworkingdirectory:/gs isyntax2ometiff 1.isyntax

Substitue "/currentworkingdirectory" for your working directory - this will map your working directory to the /gs within the docker container.

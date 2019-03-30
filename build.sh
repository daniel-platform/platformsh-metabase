#!/bin/bash

# Load header
. ./header.inc

# Desired version can be set by means of an enviromental variable
if [ -z "$METABASE_VERSION" ]; then 
	# Default to Metabase 0.32.1
	METABASE_VERSION=0.32.1; 
fi

METABASE_DOWNLOAD_URI="http://downloads.metabase.com/v${METABASE_VERSION}"
METABASE_DL_ARCHIVE="metabase.jar"

# Make directories
mkdir -p $METABASE_HOME;

# Download Metabase
echo "Downloading ${METABASE_DOWNLOAD_URI}/${METABASE_DL_ARCHIVE}"
wget --no-cookies --no-check-certificate -q -O ${METABASE_HOME}/${METABASE_JAR} ${METABASE_DOWNLOAD_URI}/${METABASE_DL_ARCHIVE}

# jq is a utility that will be used to extract memory limits from a JSON data file.
# Desired version can be set by means of an enviromental variable
if [ -z "$JQ_VERSION" ]; then 
	# Default to version 1.5
    JQ_VERSION=1.5
fi

# Download and put it in the bin folder
JQ_DOWNLOAD_URI="https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}"
JQ_DL_ARCHIVE="jq-linux64"

# Download jq
echo "Downloading ${JQ_DOWNLOAD_URI}/${JQ_DL_ARCHIVE}"
wget ${JQ_DOWNLOAD_URI}/${JQ_DL_ARCHIVE} --no-cookies --no-check-certificate -q -O bin/jq
chmod +x bin/jq


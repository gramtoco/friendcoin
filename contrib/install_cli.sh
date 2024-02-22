 #!/usr/bin/env bash

 # Execute this file to install the pejecoin cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Pejecoin-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Pejecoin-Qt.app/Contents/MacOS/pejecoind /usr/local/bin/pejecoind
 sudo ln -s ${LOCATION}/Pejecoin-Qt.app/Contents/MacOS/pejecoin-cli /usr/local/bin/pejecoin-cli

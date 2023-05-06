 #!/usr/bin/env bash

 # Execute this file to install the fren cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Fren-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Fren-Qt.app/Contents/MacOS/frend /usr/local/bin/frend
 sudo ln -s ${LOCATION}/Fren-Qt.app/Contents/MacOS/fren-cli /usr/local/bin/fren-cli

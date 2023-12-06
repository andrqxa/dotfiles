#!/bin/bash

VERSION=$1 # pick the latest version from https://golang.org/dl/
ARCH=armv6l # arm64 for 64-bit OS
GO_HOME=/opt/programming
GO_PATH=$HOME/projects/go

## Remove old version if it exists
rm -rf $GO_HOME/go

## Create folder for programm on /opt
mkdir -p $GO_HOME && chown -R $USER:$USER $GO_HOME
mkdir -p $GO_PATH/src && chown -R $USER:$USER $GO_PATH/src
mkdir -p $GO_PATH/pkg && chown -R $USER:$USER $GO_PATH/pkg 
mkdir -p $GO_PATH/bin && chown -R $USER:$USER $GO_PATH/pkg 

## Detect the user's shell and add the appropriate path variables
SHELL_TYPE=$(basename "$SHELL")

if [ "$SHELL_TYPE" = "zsh" ]; then
    echo "Found ZSH shell"
    SHELL_RC="$HOME/.zshrc"
elif [ "$SHELL_TYPE" = "bash" ]; then
    echo "Found Bash shell"
    SHELL_RC="$HOME/.bashrc"
elif [ "$SHELL_TYPE" = "fish" ]; then
    echo "Found Fish shell"
    SHELL_RC="$HOME/.config/fish/config.fish"
else
    echo "Unsupported shell: $SHELL_TYPE"
    exit 1
fi

echo 'export GOROOT=$GO_HOME/go' >> "$SHELL_RC"
echo 'export GOPATH=$GO_PATH' >> "$SHELL_RC"
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> "$SHELL_RC"

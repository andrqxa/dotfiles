#!/bin/bash

VERSION=$1 # pick the latest version from https://golang.org/dl/
ARCH=armv6l # arm64 for 64-bit OS
USR=$2 #andrejjj
MY_HOME=/home/$USR
GO_HOME=/opt/programming
echo $GO_HOME
PROJECTS=$MY_HOME/projects
GO_PATH=$PROJECTS/go
echo $GO_PATH

## Remove old version if it exists
rm -rf $GO_HOME/go
ls -la $GO_HOME

## Create folder for programm
mkdir -p $GO_HOME && chown -R $USR:$USR $GO_HOME
ls -la $GO_HOME


mkdir -p $GO_PATH/src
mkdir -p $GO_PATH/pkg
mkdir -p $GO_PATH/bin
chown -R $USR:$USR $PROJECTS

ls -la $GO_PATH

## Detect the user's shell and add the appropriate path variables
SHELL_TYPE=$(basename "$SHELL")

if [ "$SHELL_TYPE" = "zsh" ]; then
    echo "Found ZSH shell"
    SHELL_RC="$MY_HOME/.zshrc"
elif [ "$SHELL_TYPE" = "bash" ]; then
    echo "Found Bash shell"
    SHELL_RC="$MY_HOME/.bashrc"
elif [ "$SHELL_TYPE" = "fish" ]; then
    echo "Found Fish shell"
    SHELL_RC="$MY_HOME/.config/fish/config.fish"
else
    echo "Unsupported shell: $SHELL_TYPE"
    exit 1
fi

## Download the latest version of Golang
echo "Downloading Go $VERSION"
wget https://dl.google.com/go/go$VERSION.linux-$ARCH.tar.gz
echo "Downloading Go $VERSION completed"

## Extract the archive
echo "Extracting..."
tar -C $GO_HOME -xzf go$VERSION.linux-$ARCH.tar.gz
echo "Extraction complete"


echo $SHELL_RC
if [ -z "${GOROOT}" ]; then
  echo "export GOROOT=$GO_HOME/go" >> "$SHELL_RC"
  echo "export PATH=$GOROOT/bin:$PATH" >> "$SHELL_RC"
elif [ -z "${GOPATH}" ]; then
  echo "export GOPATH=$GO_PATH/go" >> "$SHELL_RC"
  echo "export PATH=$GOPATH/bin:$PATH" >> "$SHELL_RC"
fi

## Verify the installation
if [ -x "$(command -v go)" ]; then
    INSTALLED_VERSION=$(go version | awk '{print $3}')
    if [ "$INSTALLED_VERSION" == "go$VERSION" ]; then
        echo "Go $VERSION is installed successfully."
    else
        echo "Installed Go version ($INSTALLED_VERSION) doesn't match the expected version (go$VERSION)."
    fi
else
    echo "Go is not found in the PATH. Make sure to add Go's bin directory to your PATH."
fi

## Clean up
rm go$VERSION.linux-$ARCH.tar.gz

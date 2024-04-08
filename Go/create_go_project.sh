#!/bin/bash

# Check for project name argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

PROJECT_NAME=$1

# Create the directory structure
mkdir -p "$PROJECT_NAME/cmd/$PROJECT_NAME"
mkdir -p "$PROJECT_NAME/pkg/api/v1"
mkdir -p "$PROJECT_NAME/pkg/db"
mkdir -p "$PROJECT_NAME/pkg/util"
mkdir -p "$PROJECT_NAME/internal/auth"
mkdir -p "$PROJECT_NAME/api"
mkdir -p "$PROJECT_NAME/configs"
mkdir -p "$PROJECT_NAME/scripts"
mkdir -p "$PROJECT_NAME/test"

# Initialize a new Go module in the project directory
cd "$PROJECT_NAME"
go mod init "$PROJECT_NAME"

# Create a simple main.go file
cat << EOF > "cmd/$PROJECT_NAME/main.go"
package main

import "fmt"

func main() {
    fmt.Println("Hello, $PROJECT_NAME!")
}
EOF

cd ..

echo "Project structure for $PROJECT_NAME has been successfully created."

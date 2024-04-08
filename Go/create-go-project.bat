@echo off
SETLOCAL EnableDelayedExpansion

IF "%~1"=="" (
    echo Usage: %0 project_name
    exit /b 1
)

SET "PROJECT_NAME=%~1"

REM Create the project directory
mkdir "%PROJECT_NAME%"

REM Change directory to the project root
cd "%PROJECT_NAME%"

REM Initialize a new module in the project directory
go mod init %PROJECT_NAME%

REM Create the directory structure
mkdir "cmd\%PROJECT_NAME%"
mkdir "pkg\api\v1"
mkdir "pkg\db"
mkdir "pkg\util"
mkdir "internal\auth"
mkdir "api"
mkdir "configs"
mkdir "scripts"
mkdir "test"

REM Create a simple main.go file
echo package main> "cmd\%PROJECT_NAME%\main.go"
echo. >> "cmd\%PROJECT_NAME%\main.go"
echo import "fmt">> "cmd\%PROJECT_NAME%\main.go"
echo. >> "cmd\%PROJECT_NAME%\main.go"
echo func main() {>> "cmd\%PROJECT_NAME%\main.go"
echo     fmt.Println("Hello, %PROJECT_NAME%!")>> "cmd\%PROJECT_NAME%\main.go"
echo }>> "cmd\%PROJECT_NAME%\main.go"

REM Change directory back to the original location
cd ..

echo Project structure for %PROJECT_NAME% has been successfully created.

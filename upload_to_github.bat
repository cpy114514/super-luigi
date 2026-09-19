@echo off
title GitHub Quick Upload

echo ================================
echo       GitHub Quick Upload
echo ================================
echo.

cd /d "%~dp0"

echo [1/3] Adding files...
git add .

echo.
echo [2/3] Committing changes...

set /p msg=Commit message: 

if "%msg%"=="" set msg=Update project

git commit -m "%msg%"

echo.
echo [3/3] Pushing to GitHub...
git push

echo.
echo ================================
echo       Upload complete!
echo ================================
pause
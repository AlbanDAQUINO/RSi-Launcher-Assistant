@ECHO OFF

SETLOCAL ENABLEEXTENSIONS
SET _ME=%~n0
SET _PARENT=%~dp0

SET INSTALL_LOCATION=C:\Games\Roberts Space Industries


ECHO Ultimate Shaders/USER directory remover for Star Citizen
ECHO --------------------------------------------------------
ECHO - v0.2 (AlexGranger)
ECHO.

ECHO ===== LIVE Environment :
IF EXIST "%INSTALL_LOCATION%\StarCitizen\LIVE\USER\Client\0\Shaders" (
  ECHO Removing Shaders !
  RD /S /Q "%INSTALL_LOCATION%\StarCitizen\LIVE\USER\Client\0\Shaders"
  ) ELSE (
  ECHO No files found ...
  )
TIMEOUT /T 5
ECHO.

ECHO ===== PTU Environment :
IF EXIST "%INSTALL_LOCATION%\StarCitizen\PTU\USER\Client\0\Shaders" (
  ECHO Removing Shaders !
  RD /S /Q "%INSTALL_LOCATION%\StarCitizen\PTU\USER\Client\0\Shaders"
  ) ELSE (
  ECHO No files found ...
  )
TIMEOUT /T 5
ECHO.



ECHO Starting Launcher ...
START /ABOVENORMAL "Star Citizen" /D "%INSTALL_LOCATION%\RSI Launcher" "RSI Launcher.exe"
ECHO.

#PAUSE

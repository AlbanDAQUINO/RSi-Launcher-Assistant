@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

:: User Settings >>> MAKE YOUR CHANGE BELOW HERE <<<
SET INSTALL_LOCATION=C:\Games\Roberts Space Industries

:: Script Settings >>> NOT BELOW HERE <<<
SET BACKUP_LOCATION=%INSTALL_LOCATION%\_Backups
SET STARCITIZEN_ENV=LIVE

:: Display Header
ECHO.
ECHO Ultimate Shaders/USER directory cleaner for Star Citizen
ECHO --------------------------------------------------------
ECHO - v0.4.1: Fix for Issue 1 (AlexGranger)
ECHO.
ECHO - List of files :
ECHO -- \StarCitizen\%STARCITIZEN_ENV%\USER.cfg
ECHO -- \StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\attributes.xml
ECHO -- \StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\actionmaps.xml
ECHO.


:: CD to the install directory
CD "%INSTALL_LOCATION%"

:: Backups Section
ECHO Backups
ECHO --------
ECHO -^? Checking the Backup directory ...
IF EXIST "%INSTALL_LOCATION%\_Backups" (
  ECHO -- Backup Directory - Detected ^!
) ELSE (
  ECHO  ^|-+ Creating directory ...
  MKDIR "%INSTALL_LOCATION%\_Backups"
)

ECHO -^? Checking for backups ...
IF EXIST "%INSTALL_LOCATION%\_Backups\user.cfg" (
  ECHO  ^|-- User.cfg backup present ^!
) ELSE (
  ECHO  ^|-- No User.cfg file found ...
  ECHO  ^|-+ Creating backup from %STARCITIZEN_ENV% ...
  COPY /V /Y "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER.cfg" "%INSTALL_LOCATION%\_Backups\USER.cfg"
)
IF EXIST "%INSTALL_LOCATION%\_Backups\attributes.xml" (
  ECHO  ^|-- Parameters backup present ^!
) ELSE (
  ECHO  ^|-- No Parameters file found ...
  ECHO  ^|-+ Creating backup from %STARCITIZEN_ENV% ...
  COPY /V /Y "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\attributes.xml" "%INSTALL_LOCATION%\_Backups\attributes.xml"
)
IF EXIST "%INSTALL_LOCATION%\_Backups\actionmaps.xml" (
  ECHO  ^|-- Key Binds backup present ^!
) ELSE (
  ECHO  ^|-- No Key Binds file found ...
  ECHO  ^|-+ Creating backup from %STARCITIZEN_ENV% ...
  COPY /V /Y "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\actionmaps.xml" "%INSTALL_LOCATION%\_Backups\actionmaps.xml"
)
TIMEOUT /T 5
ECHO.

:: Checking the LIVE environment
SET STARCITIZEN_ENV=LIVE

ECHO LIVE Environment
ECHO -----------------
ECHO -^? Checking %STARCITIZEN_ENV% directory ...
IF NOT EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default" (
  MKDIR "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default"
)
IF EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER.cfg" (
  ECHO -- User.cfg - Detected ^!
) ELSE (
  ECHO -- User.cfg - File not found ...
  ECHO  ^|-+ Restoring backup ^!
  COPY /V /Y "%INSTALL_LOCATION%\_Backups\USER.cfg" "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER.cfg"
)
IF EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\attributes.xml" (
  ECHO -- Parameters - Detected ^!
) ELSE (
  ECHO -- Parameters - File not found ...
  ECHO  ^|-+ Restoring backup ^!
  COPY /V /Y "%INSTALL_LOCATION%\_Backups\attributes.xml" "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\attributes.xml"
)
IF EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\actionmaps.xml" (
  ECHO -- Key Bindings - Detected ^!
) ELSE (
  ECHO -- Key Bindings - File not found ...
  ECHO  ^|-+ Restoring backup ^!
  COPY /V /Y "%INSTALL_LOCATION%\_Backups\actionmaps.xml" "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\actionmaps.xml"
)
IF EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Shaders" (
  ECHO -- Shaders - Detected ^!
  ECHO  ^|-- Cleaning directory ^!
  RD /S /Q "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Shaders"
) ELSE (
  ECHO -- Shaders - Files not found ...
)
TIMEOUT /T 5
ECHO.

:: Checking the PTU environment
SET STARCITIZEN_ENV=PTU

ECHO PTU Environment
ECHO ----------------
ECHO -^? Checking %STARCITIZEN_ENV% directory ...
IF NOT EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default" (
  MKDIR "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default"
)
IF EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER.cfg" (
  ECHO -- User.cfg - Detected ^!
) ELSE (
  ECHO -- User.cfg - File not found ...
  ECHO  ^|-+ Restoring backup ^!
  COPY /V /Y "%INSTALL_LOCATION%\_Backups\USER.cfg" "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER.cfg"
)
IF EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\attributes.xml" (
  ECHO -- Parameters - Detected ^!
) ELSE (
  ECHO -- Parameters - File not found ...
  ECHO  ^|-+ Restoring backup ^!
  COPY /V /Y "%INSTALL_LOCATION%\_Backups\attributes.xml" "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\attributes.xml"
)
IF EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\actionmaps.xml" (
  ECHO -- Key Bindings - Detected ^!
) ELSE (
  ECHO -- Key Bindings - File not found ...
  ECHO  ^|-+ Restoring backup ^!
  COPY /V /Y "%INSTALL_LOCATION%\_Backups\actionmaps.xml" "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Profiles\default\actionmaps.xml"
)
IF EXIST "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Shaders" (
  ECHO -- Shaders - Detected ^!
  ECHO  ^|-- Cleaning directory ^!
  RD /S /Q "%INSTALL_LOCATION%\StarCitizen\%STARCITIZEN_ENV%\USER\Client\0\Shaders"
) ELSE (
  ECHO -- Shaders - Files not found ...
)
TIMEOUT /T 5
ECHO.


:: Starting the Launcher
ECHO Starting Launcher -------------------------------------
ECHO -- Starting Process with ABOVENORMAL priority ...
START /ABOVENORMAL "Star Citizen" /D "%INSTALL_LOCATION%\RSI Launcher" "RSI Launcher.exe"
ECHO.


:: End of the script
:END
ECHO -- EoB
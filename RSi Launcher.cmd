@ECHO OFF

SET INSTALL_LOCATION=C:\Games\Roberts Space Industries


ECHO.
ECHO Ultimate Shaders/USER directory cleaner for Star Citizen
ECHO --------------------------------------------------------
ECHO - v0.3.1 (AlexGranger)
ECHO.



ECHO LIVE Environment
ECHO -----------------
IF EXIST "%INSTALL_LOCATION%\StarCitizen\LIVE\USER\Client\0\Profiles\default\actionmaps.xml" (
  ECHO -- Key Bindings - Detected ^!
  ECHO  ^|-+ Creating backup ...
  ECHO  ^|-- Cleaning directory ^!
  ECHO  --+ Restoring backup ^!
  ) ELSE (
  ECHO -- Key Bindings - No file found ...
  ECHO  ^|-+ Restoring backup ^!
  )
IF EXIST "%INSTALL_LOCATION%\StarCitizen\LIVE\USER\Client\0\Shaders" (
  ECHO -- Shaders - Detected ^!
  ECHO  ^|-- Cleaning directory ^!
  RD /S /Q "%INSTALL_LOCATION%\StarCitizen\LIVE\USER\Client\0\Shaders"
  ) ELSE (
  ECHO -- Shaders - No files found ...
  )
TIMEOUT /T 5
ECHO.



ECHO PTU Environment
ECHO ----------------
IF EXIST "%INSTALL_LOCATION%\StarCitizen\PTU\USER\Client\0\Profiles\default\actionmaps.xml" (
  ECHO -- Key Bindings - Detected ^!
  ECHO  ^|-+ Creating backup ...
  ECHO  ^|-- Cleaning directory ^!
  ECHO  --+ Restoring backup ^!
  ) ELSE (
  ECHO -- Key Bindings - No file found ...
  ECHO  ^|-+ Restoring backup ^!
  )
IF EXIST "%INSTALL_LOCATION%\StarCitizen\PTU\USER\Client\0\Shaders" (
  ECHO -- Shaders - Detected ^!
  ECHO  ^|-- Cleaning directory ^!
  RD /S /Q "%INSTALL_LOCATION%\StarCitizen\PTU\USER\Client\0\Shaders"
  ) ELSE (
  ECHO -- Shaders - No files found ...
  )
TIMEOUT /T 5
ECHO.



ECHO Starting Launcher -------------------------------------
ECHO -- Starting Process with ABOVENORMAL priority ...
START /ABOVENORMAL "Star Citizen" /D "%INSTALL_LOCATION%\RSI Launcher" "RSI Launcher.exe"
ECHO.

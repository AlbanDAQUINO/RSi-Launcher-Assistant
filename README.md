# RSi-Launcher

## EN:
The script can be saved anywhere.

IMPORTANT: You will need to self sign or change the *Execution Policy* for this script!

You only need to ensure that the constant _'SC_INSTALL_PATH'_ point to your Star Citizen directory (It should by default).

```PowerShell 
# 
# User Settings >>> MAKE YOUR CHANGES BELOW HERE <<<
# ------------------------------------------------------------------------

# Star Citizen installation directory
$SC_INSTALL_PATH = "C:\Program Files\Roberts Space Industries"

# Prefered SOURCE for backups
$SC_ENV = "LIVE"

# List of files to backup 'C:\Program Files\Roberts Space Industries\Star Citizen\$SC_ENV\'
$SC_FILES = (
    "USER.cfg",
    "USER\Client\0\Profiles\default\attributes.xml",
    "USER\Client\0\Profiles\default\actionmaps.xml"
    )

```

_Shaders_ and _USER_ directory cleaner. **PUF**, gone ...

## FR:
Le script peut etre sauvegardé n'importe ou..

IMPORTANT: Vous devrez signer digitalement le script ou changer son *Execution Policy* !

Vous devez juste vous assurer que la valeur du parametre _'SC_INSTALL_PATH'_ pointe bien sur le bon répertoire (Ca devrait par défaut).

```PowerShell 
# 
# User Settings >>> MAKE YOUR CHANGES BELOW HERE <<<
# ------------------------------------------------------------------------

# Star Citizen installation directory
$SC_INSTALL_PATH = "C:\Program Files\Roberts Space Industries"

# Prefered SOURCE for backups
$SC_ENV = "LIVE"

# List of files to backup 'C:\Program Files\Roberts Space Industries\Star Citizen\$SC_ENV\'
$SC_FILES = (
    "USER.cfg",
    "USER\Client\0\Profiles\default\attributes.xml",
    "USER\Client\0\Profiles\default\actionmaps.xml"
    )

```

Nettoyeur de répertoire _Shaders_ et _USER_. **POUF**, y'apu ...

Alex.

## Note(s):
This is a bug fix release. Bare bone, with minimal features.


### Screenshot:
_1._
![RSiLauncherAssistant-01](https://user-images.githubusercontent.com/1471248/127697888-a714c7cd-3438-49ea-af45-8f0aaf6f3bc5.png)

Bug fix for Issue #1 
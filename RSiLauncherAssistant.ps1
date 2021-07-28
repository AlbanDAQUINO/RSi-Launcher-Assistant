# 
# User Settings >>> MAKE YOUR CHANGES BELOW HERE <<<
# ------------------------------------------------------------------------

# Star Citizen installation directory
$SC_INSTALL_PATH = "C:\Games\Roberts Space Industries"

# Prefered SOURCE for backups
$SC_ENV = "LIVE"

# List of files to backup
$SC_FILES = (
    "USER.cfg",
    "USER\Client\0\Profiles\default\attributes.xml",
    "USER\Client\0\Profiles\default\actionmaps.xml"
    )

# 
# Script Settings >>> DO NOT MAKE ANY CHANGES BELOW HERE <<<
# ------------------------------------------------------------------------ 

# Generating TimeString for the log file name
$DATESTRING = (Get-Date -Format "yyyy-MM-dd")
# Generating first TimeStamp
$DATESTAMP = (Get-Date -Format "HH:mm:ss - FFFF")

# Setting the Logs directory
$SC_LOG_DIRECTORY = "_Logs"

# Setting the Backups directory
$SC_BACKUP_DIRECTORY = "_Backups"

# Building the full Logs directory path
$SC_LOG_PATH = $SC_INSTALL_PATH + "\" + $SC_LOG_DIRECTORY

# Building the full Backups directory path
$SC_BACKUP_PATH = $SC_INSTALL_PATH + "\" + $SC_BACKUP_DIRECTORY

# Setting the daily Log file name / full path name
$SC_LOG_FILE_NAME = "Log-$DATESTRING.log"
$SC_LOG_FILE = $SC_LOG_PATH + "\" + $SC_LOG_FILE_NAME

# Number of log files that should be retained
$SC_LOG_FILES_MAX = 6

# 
# Displaying console banner
# ------------------------------------------------------------------------ 
Write-Host -ForegroundColor White " "
Write-Host -ForegroundColor White "Ultimate Shaders/USER directory cleaner for Star Citizen"
Write-Host -ForegroundColor White "--------------------------------------------------------"
Write-Host -ForegroundColor White "- v0.5.0: PowerShell Conversion (AlexGranger)"
Write-Host -ForegroundColor White " "
Write-Host -ForegroundColor White "- List of files :"
# Listing all the files in the list
Foreach ($FILE in $SC_FILES) { Write-Host -ForegroundColor White " $FILE" }
Write-Host -ForegroundColor White " "

# Test/Create Logs Directory ...
Write-Host -ForegroundColor White "Checking Logs Directory -----"
# Checking the existance of the logs directory
if (!(Test-Path $SC_LOG_PATH)) {
    # Logs directory didn't exist, setting variable for delayed file logging
    $SC_LOGDIR_EXIST = 0
    # Creating Logs directory
    New-Item -ItemType "Directory" -Path $SC_INSTALL_PATH -Name $SC_LOG_DIRECTORY | Out-Null
    # Displaying console message
    Write-Host -ForegroundColor DarkYellow "Creating Logs Directory '$SC_LOG_PATH'."
    }
else {
    # Logs directory is present, setting variable for late delayed file logging
    $SC_LOGDIR_EXIST = 1
    # Displaying console message
    Write-Host -ForegroundColor Green "Ok."
    }

# Test/Create Log File ...
# Saving previous TimeStamp
$DATESTAMP_PREVIOUS = (Echo $DATESTAMP)
# Generating new TimeStamp
$DATESTAMP = (Get-Date -Format "HH:mm:ss - FFFF")
Write-Host -ForegroundColor White "Checking the Log File '$SC_LOG_FILE_NAME' -----"
# Checking if the log file exist
if (!(Test-Path $SC_LOG_FILE)) {
    New-Item -ItemType "File" -Path $SC_LOG_PATH -Name $SC_LOG_FILE_NAME | Out-Null
    if ($SC_LOGDIR_EXIST -eq 0) {
        Echo "$DATESTAMP_PREVIOUS - Creating Logs Directory '$SC_LOG_PATH'." >> $SC_LOG_FILE
        Echo "$DATESTAMP - Creating Log File '$SC_LOG_FILE_NAME' in '$SC_LOG_PATH'." >> $SC_LOG_FILE
        }
    else {
        Echo "$DATESTAMP - Creating Log File '$SC_LOG_FILE_NAME' in '$SC_LOG_PATH'." >> $SC_LOG_FILE
    }
    Write-Host -ForegroundColor DarkYellow "Creating Log File '$SC_LOG_FILE_NAME' in '$SC_LOG_PATH'."
    }
else {
    Echo " " >> $SC_LOG_FILE
    Echo "-----" >> $SC_LOG_FILE
    Echo "$DATESTAMP - Opening Log File '$SC_LOG_FILE_NAME' in '$SC_LOG_PATH'." >> $SC_LOG_FILE
    Write-Host -ForegroundColor Green "Ok (Append Mode)."
    }

# Test/Create Backup Directory ...
# Generating new TimeStamp
$DATESTAMP = (Get-Date -Format "HH:mm:ss - FFFF")
# Displaying console message
Write-Host -ForegroundColor White "Checking Backups Directory -----"
if (!(Test-Path $SC_BACKUP_PATH)) {
    New-Item -ItemType "Directory" -Path $SC_INSTALL_PATH -Name $SC_BACKUP_DIRECTORY | Out-Null
    Echo "$DATESTAMP - Creating Backups Directory '$SC_BACKUP_PATH'." >> $SC_LOG_FILE
    Write-Host -ForegroundColor DarkYellow "Creating Backups Directory '$SC_BACKUP_PATH'."
    }
else {
    Echo "$DATESTAMP - Using Backups Directory '$SC_BACKUP_PATH'." >> $SC_LOG_FILE
    Write-Host -ForegroundColor Green "Ok."
    }

# Test/Delete Shaders in both environements
# Displaying console message
Write-Host -ForegroundColor White "Checking Shaders Directories -----"
# Generating new TimeStamp
$DATESTAMP = (Get-Date -Format "HH:mm:ss - FFFF")
Echo "$DATESTAMP - Checking Shaders Directories -----" >> $SC_LOG_FILE
# Setting environements
$SC_ENVS = ( "LIVE", "PTU" )
# So for each of them ...
Foreach ($SC_ENV in $SC_ENVS) {
    # Setting the full path of the directory
    $SC_SHADERS = ($SC_INSTALL_PATH + "\StarCitizen\" + $SC_ENV + "\USER\Client\0\Shaders")
    if ((Test-Path $SC_SHADERS)) {
        # Generating new TimeStamp
        $DATESTAMP = (Get-Date -Format "HH:mm:ss - FFFF")
        Echo "$DATESTAMP - Removing Shaders directory in '$SC_ENV'." >> $SC_LOG_FILE
        # Removing the Shaders directory
        Remove-Item $SC_SHADERS -Force -Recurse
        # Displaying console message
        Write-Host -ForegroundColor Red "Removing Shaders directory in '$SC_ENV'."
       }
    else {
        # Generating new TimeStamp
        $DATESTAMP = (Get-Date -Format "HH:mm:ss - FFFF")
        Echo "$DATESTAMP - Ok. Nothing in '$SC_ENV'." >> $SC_LOG_FILE
        # Displaying console message
        Write-Host -ForegroundColor Green "Ok. Nothing in '$SC_ENV'."
    }
}




# Setting environements
$SC_ENVS = ( "LIVE", "PTU" )

# Displaying console message
Echo "$DATESTAMP - Checking backuped files -----" >> $SC_LOG_FILE
Write-Host -ForegroundColor White "Checking backuped files -----"
# Checking backuped files ...
Foreach ($SC_ENV in $SC_ENVS) {
    # Checking backup files
    Foreach ($FILE in $SC_FILES) {
        # Generating new TimeStamp
        $DATESTAMP = (Get-Date -Format "HH:mm:ss - FFFF")
        # 
        $FILE_NAME = "$SC_INSTALL_PATH\StarCitizen\$SC_ENV\$FILE"
        $FILE_NAME = Split-Path $FILE_NAME -Leaf
        Echo "$DATESTAMP - Checking for '$SC_ENV-$FILE_NAME'." >> $SC_LOG_FILE
        Write-Host -ForegroundColor Green "- '$SC_ENV-$FILE_NAME'."
        }
}


# Checking user files for each of the environements ...
$SC_COLOR = "Yellow"
Echo "$DATESTAMP - Checking game files -----" >> $SC_LOG_FILE
Foreach ($SC_ENV in $SC_ENVS) {
    # Displaying console message
    Write-Host -ForegroundColor White "Checking files in '$SC_ENV' -----"
    # Checking backup files
    Foreach ($FILE in $SC_FILES) {
        # Generating new TimeStamp
        $DATESTAMP = (Get-Date -Format "HH:mm:ss - FFFF")
        Echo "$DATESTAMP - Checking for '$SC_ENV\$FILE'." >> $SC_LOG_FILE
        # 
        Write-Host -ForegroundColor $SC_COLOR "- '$SC_ENV\$FILE'."
        }
    $SC_COLOR = "DarkYellow"
}
# 

### PSReadLine Options ###
set-psreadlineoption -predictionsource history


### User Aliases ###
# Force Remove file/folder
function rmf([string]$name)
{
	Remove-Item -Force -Recurse $name
}

# Open File Explorer in Current Directory
function explore { explorer.exe . }


### MODULES ###
# Show Colors in ls command
Import-Module Get-ChildItemColor

# Z Module for Changing Directory
Import-Module z

# Starship Prompt
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.starship"

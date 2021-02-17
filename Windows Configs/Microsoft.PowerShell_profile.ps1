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

# Starship Prompt
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.starship"

# Zoxide(z utility to change directory)
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
})
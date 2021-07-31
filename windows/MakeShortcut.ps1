param([string] $Source, [string] $Arguments)
$WShell = New-Object -comObject WScript.Shell
$Shortcut = $WShell.CreateShortcut($Source)
$Shortcut.TargetPath = "cmd.exe"
$Shortcut.Arguments = "/c $Arguments"
$Shortcut.Save()
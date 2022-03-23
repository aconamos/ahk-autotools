Write-Information "Removing items..."
Remove-Item -Path ".\bin\*"

Write-Information "Building..."
./compiler/Ahk2Exe.exe /in ".\src\autotools.ahk" /out ".\bin\autotools.exe" /base "C:\Users\student\Documents\clicker\compiler\Unicode 64-bit.bin"

Write-Progress "Complete!"
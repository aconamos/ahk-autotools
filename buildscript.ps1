Write-Information "Removing items..."
Remove-Item -Path ".\bin\clicker.exe"
Remove-Item -Path ".\bin\walker.exe"

Write-Information "Building..."
./compiler/Ahk2Exe.exe /in ".\src\clicker.ahk" /out ".\bin\clicker.exe" /base "C:\Users\student\Documents\clicker\compiler\Unicode 64-bit.bin"
./compiler/Ahk2Exe.exe /in ".\src\walker.ahk" /out ".\bin\walker.exe" /base "C:\Users\student\Documents\clicker\compiler\Unicode 64-bit.bin"

Write-Progress "Complete!"
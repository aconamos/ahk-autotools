Write-Information "Removing items..."
Remove-Item -Path ".\bin\*"

Write-Information "Building..."
$srcItems = Get-ChildItem -Path ".\src\" -Name
$srcArray = $srcItems -split "\r\n"
$basePath = Resolve-Path -Path ".\compiler\Unicode 64-bit.bin"

foreach ($f in $srcArray) {
    $srcPath = ".\src\" + $f
    ./compiler/Ahk2Exe.exe /in $srcPath /out ".\bin\" /base $basePath /silent
}

Write-Progress "Complete!"
$version = "0.0.2"

Write-Host "Removing items..."
Remove-Item -Path ".\bin\*"

Write-Host "Building..."
$srcItems = Get-ChildItem -Path ".\src\" -Name
$srcArray = $srcItems -split "\r\n"
$basePath = Resolve-Path -Path ".\compiler\Unicode 64-bit.bin"

foreach ($f in $srcArray) {
    $srcPath = ".\src\" + $f
    $binPath = ".\bin\" + $f.TrimEnd(".ahk") + "-" + $version + ".exe"
    ./compiler/Ahk2Exe.exe /in $srcPath /out $binPath /base $basePath /silent
}

Write-Host "Complete!"
# How to build
This command builds for non-administrator users. Otherwise, use your own discretion to do your own thing.
`powershell -ExecutionPolicy ByPass -File buildscript.ps1`

**Warning**: Ahk2Exe.exe won't work without having an absolute path to your .bin file. This means you have to change the buildscript for each computer you run it on. I can't be bothered to do powershell trickery to get the absolute path for everything, submit a pr if this is particularly important to you.
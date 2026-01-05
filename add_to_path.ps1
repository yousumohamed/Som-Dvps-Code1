# Script to add Som DVPS to User Path
$InstallDir = "c:\code\vscode"
$CurrentPath = [Environment]::GetEnvironmentVariable("Path", "User")

if ($CurrentPath -like "*$InstallDir*") {
    Write-Host "Success: Som DVPS is already in your PATH!" -ForegroundColor Green
} else {
    $NewPath = "$CurrentPath;$InstallDir"
    [Environment]::SetEnvironmentVariable("Path", $NewPath, "User")
    Write-Host "Success: Added Som DVPS to your PATH!" -ForegroundColor Green
    Write-Host "Please close this terminal and open a new one for changes to take effect." -ForegroundColor Yellow
}

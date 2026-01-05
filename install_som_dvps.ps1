# Som DVPS Installation Script
# This script installs all dependencies with proper configuration

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Som DVPS - Installation Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Set environment variables for this session
$env:npm_config_msvs_version = "2022"
$env:npm_config_msvs_args = "/p:SpectreMitigation=false"

Write-Host "Environment configured:" -ForegroundColor Yellow
Write-Host "  - Visual Studio: 2022" -ForegroundColor Gray
Write-Host "  - Spectre Mitigation: Disabled" -ForegroundColor Gray
Write-Host ""

Write-Host "Installing dependencies..." -ForegroundColor Yellow
Write-Host ""

# Run npm install
npm install

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "SUCCESS! Installation completed." -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Run: npm run watch" -ForegroundColor White
    Write-Host "2. In a new terminal, run: .\scripts\code.bat" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "Installation failed." -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "The Spectre libraries are still required." -ForegroundColor Yellow
    Write-Host "Please install them from Visual Studio Installer:" -ForegroundColor Yellow
    Write-Host "  1. Open Visual Studio Installer" -ForegroundColor White
    Write-Host "  2. Click 'Modify' on VS 2022" -ForegroundColor White
    Write-Host "  3. Go to 'Individual components' tab" -ForegroundColor White
    Write-Host "  4. Search for 'Spectre'" -ForegroundColor White
    Write-Host "  5. Check: 'MSVC v143 - VS 2022 C++ x64/x86 Spectre-mitigated libs'" -ForegroundColor White
    Write-Host "  6. Click 'Modify' to install" -ForegroundColor White
    Write-Host ""
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

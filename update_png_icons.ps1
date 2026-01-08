
Add-Type -AssemblyName System.Drawing

$iconPath = "resources\win32\code.ico"
$targetPath = "resources\win32"

if (-not (Test-Path $iconPath)) {
	Write-Host "Error: code.ico not found!"
	exit
}

$icon = [System.Drawing.Icon]::ExtractAssociatedIcon((Resolve-Path $iconPath))
$bitmap = $icon.ToBitmap()

function Save-ResizedImage {
	param ($srcImage, $width, $height, $path)
	$newImage = new-object System.Drawing.Bitmap $width, $height
	$graph = [System.Drawing.Graphics]::FromImage($newImage)
	$graph.Clear([System.Drawing.Color]::Transparent)
	$graph.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
	$graph.DrawImage($srcImage, 0, 0, $width, $height)
	$newImage.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
	$graph.Dispose()
	$newImage.Dispose()
	Write-Host "Updated: $path"
}

# The files VS Code actually uses for the window icon might be these PNGs if the ICO isn't picked up
Save-ResizedImage $bitmap 70 70 "$targetPath\code_70x70.png"
Save-ResizedImage $bitmap 150 150 "$targetPath\code_150x150.png"

$bitmap.Dispose()
$icon.Dispose()
Write-Host "PNG icons updated from code.ico!"

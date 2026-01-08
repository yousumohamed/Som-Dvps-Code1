
Add-Type -AssemblyName System.Drawing

$iconPath = "resources\win32\code.ico"
$smallPath = "resources\win32"
$bigPath = "resources\win32"

if (-not (Test-Path $iconPath)) {
    Write-Host "Error: code.ico not found!"
    exit
}

$icon = [System.Drawing.Icon]::ExtractAssociatedIcon((Resolve-Path $iconPath))
$bitmap = $icon.ToBitmap()

# Function to Resize and Save
function Save-ResizedImage {
    param ($srcImage, $width, $height, $path)
    $newImage = new-object System.Drawing.Bitmap $width, $height
    $graph = [System.Drawing.Graphics]::FromImage($newImage)
    $graph.Clear([System.Drawing.Color]::White)
    $graph.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic

    # Draw centered
    # For the big banner, we want to center the icon on a white background, not stretch it entirely
    # For small, we can stretch

    if ($width -gt $height) { # Generally small icon is square-ish
         $graph.DrawImage($srcImage, 0, 0, $width, $height)
    } else {
         # Big Vertical Banner: Center the icon
         # Aspect ratio of icon
         $aspect = $srcImage.Width / $srcImage.Height
         $targetWidth = $width * 0.8
         $targetHeight = $targetWidth / $aspect
         $x = ($width - $targetWidth) / 2
         $y = ($height - $targetHeight) / 2
         $graph.DrawImage($srcImage, [int]$x, [int]$y, [int]$targetWidth, [int]$targetHeight)
    }

    $newImage.Save($path, [System.Drawing.Imaging.ImageFormat]::Bmp)
    $graph.Dispose()
    $newImage.Dispose()
    Write-Host "Updated: $path"
}

# Update Small Images (Square-ish)
Get-ChildItem "$smallPath\inno-small-*.bmp" | ForEach-Object {
    Save-ResizedImage $bitmap 55 55 $_.FullName
}

# Update Big Images (Vertical Banner)
Get-ChildItem "$bigPath\inno-big-*.bmp" | ForEach-Object {
    Save-ResizedImage $bitmap 164 314 $_.FullName
}

$bitmap.Dispose()
$icon.Dispose()
Write-Host "All installer images updated from code.ico!"

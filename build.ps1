# Check if gitversion is available
if (-not (Get-Command "dotnet-gitversion" -ErrorAction SilentlyContinue)) {
    Write-Host "Installing GitVersion.Tool..."
    dotnet tool install --global GitVersion.Tool
}

# Generate Version variables
Write-Host "Calculating version..."
$gv = dotnet-gitversion | ConvertFrom-Json

$version = $gv.SemVer
$dockerTag = $gv.SemVer

Write-Host "Determined Version: $version"
Write-Host "Docker Tag: $dockerTag"

# Build Docker Image
Write-Host "Building Docker image..."
docker build -t myapp:$dockerTag --build-arg VERSION=$version .

Write-Host "Build Complete: myapp:$dockerTag"

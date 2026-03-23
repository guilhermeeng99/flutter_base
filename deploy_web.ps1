$ErrorActionPreference = "Continue"

$cyan  = "$([char]27)[96m"
$green = "$([char]27)[92m"
$red   = "$([char]27)[91m"
$reset = "$([char]27)[0m"

Write-Host "${cyan}=== Building Flutter Web ===${reset}"
flutter build web --release --base-href /flutter_base/ --no-wasm-dry-run

if ($LASTEXITCODE -ne 0) {
    Write-Host "${red}Build failed! Aborting.${reset}"
    exit 1
}

Write-Host "${cyan}=== Deploying to GitHub Pages ===${reset}"
Push-Location "build\web"

git init -b gh-pages
git add .
git commit -m "Update"
git remote remove origin 2>$null
git remote add origin https://github.com/guilhermeeng99/flutter_base.git
git push -f origin gh-pages

if ($LASTEXITCODE -ne 0) {
    Write-Host "${red}Push failed!${reset}"
    Pop-Location
    exit 1
}

Pop-Location
Write-Host "${green}=== Deploy complete! ===${reset}"

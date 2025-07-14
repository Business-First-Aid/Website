#For PowerShell v3
Function gig {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$list
    )
    $params = ($list | ForEach-Object { [uri]::EscapeDataString($_) }) -join ','
    Invoke-WebRequest -Uri "https://www.toptal.com/developers/gitignore/api/$params" | Select-Object -ExpandProperty content | Out-File -FilePath $(Join-Path -Path $pwd -ChildPath '.gitignore') -Encoding ascii
}

gig -list hugo, obsidian, powershell, visualstudiocode, macos, windows, linux

Add-Content -Path .\.gitignore -Value '# Repository Specific' -Encoding ascii
Add-Content -Path .\.gitignore -Value '.trash' -Encoding ascii
Add-Content -Path .\.gitignore -Value '.vault-nickname' -Encoding ascii

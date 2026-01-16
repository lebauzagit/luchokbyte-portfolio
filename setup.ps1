<#
setup.ps1 - crea enlaces simbólicos por IA para cada skill.md (Windows-friendly)
Uso: .\setup.ps1 claude gemini gpt
#>
param(
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$IAs = @('claude','gemini','gpt')
)

Set-Location -Path (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

Get-ChildItem -Path skills -Directory | ForEach-Object {
    $skillDir = $_.FullName
    $base = $_.Name
    $skillFile = Join-Path $skillDir 'skill.md'
    if (-not (Test-Path $skillFile)) { return }

    foreach ($ia in $IAs) {
        $link = Join-Path $skillDir ("$base.$ia.md")
        if (Test-Path $link) { Remove-Item -Path $link -Force }

        try {
            New-Item -ItemType SymbolicLink -Path $link -Target $skillFile -Force | Out-Null
            Write-Host "Created symlink $link -> $skillFile"
        } catch {
            Write-Warning "Could not create symbolic link for $link (permissions or policy). Falling back to file copy."
            Copy-Item -Path $skillFile -Destination $link -Force
            Write-Host "Copied $skillFile to $link"
        }
    }
}

Write-Host 'setup.ps1 completed. Created model-specific links/copies for skills/'
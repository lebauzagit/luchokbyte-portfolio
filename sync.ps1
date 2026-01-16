<#
sync.ps1 - sincroniza las skills en Agent.md basándose en la propiedad Scope
Reemplaza el bloque entre <!-- SKILLS-START --> y <!-- SKILLS-END -->
#>

Set-Location -Path (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
$agentFile = 'Agent.md'
if (-not (Test-Path $agentFile)) { Write-Error 'Agent.md no encontrado'; exit 1 }

$startMark = '<!-- SKILLS-START -->'
$endMark = '<!-- SKILLS-END -->'

# Leer skills
$skillPaths = Get-ChildItem -Path skills -Recurse -Filter skill.md | ForEach-Object { $_.FullName }
$scopeMap = @{}

foreach ($p in $skillPaths) {
    $lines = Get-Content -Path $p -Raw -ErrorAction SilentlyContinue -Encoding UTF8
    # Extraer simple metadata Name:, Trigger:, Scope:, Description: desde el inicio
    $name = ([regex]::Match($lines,'(?m)^Name:[ \t]*(.+)$')).Groups[1].Value.Trim()
    $trigger = ([regex]::Match($lines,'(?m)^Trigger:[ \t]*(.+)$')).Groups[1].Value.Trim()
    $scope = ([regex]::Match($lines,'(?m)^Scope:[ \t]*(.+)$')).Groups[1].Value.Trim()
    if (-not $scope) { $scope = 'Root' }
    $rel = $p -replace '\\','/'
    $entry = "- `$scope` - `$name` — trigger: \"$trigger\" — path: $rel"
    if ($scopeMap.ContainsKey($scope)) {
        $scopeMap[$scope] += "`n" + $entry
    } else {
        $scopeMap[$scope] = $entry
    }
}

# Construir bloque generado
$sb = New-Object System.Text.StringBuilder
$sb.AppendLine($startMark) | Out-Null
$sb.AppendLine('<!-- START GENERATED SKILLS: DO NOT EDIT MANUALLY -->') | Out-Null
$sb.AppendLine() | Out-Null
$sb.AppendLine('## Skills por Scope (generado automáticamente)') | Out-Null
$sb.AppendLine() | Out-Null
foreach ($s in @('UI','Data','Root')) {
    if ($scopeMap.ContainsKey($s)) {
        $sb.AppendLine("### $s") | Out-Null
        $sb.AppendLine($scopeMap[$s]) | Out-Null
        $sb.AppendLine() | Out-Null
    }
}
# Otros scopes
foreach ($k in $scopeMap.Keys) {
    if ($k -in @('UI','Data','Root')) { continue }
    $sb.AppendLine("### $k") | Out-Null
    $sb.AppendLine($scopeMap[$k]) | Out-Null
    $sb.AppendLine() | Out-Null
}
$sb.AppendLine('<!-- END GENERATED SKILLS -->') | Out-Null
$sb.AppendLine($endMark) | Out-Null

# Reemplazar bloque en Agent.md
$content = Get-Content -Path $agentFile -Raw -Encoding UTF8
$pattern = [regex]::Escape($startMark) + '.*?' + [regex]::Escape($endMark)
$newBlock = [regex]::Escape($startMark) -replace '\\','' # placeholder to keep start
$newBlock = $sb.ToString()

if ($content -match $pattern) {
    $newContent = [regex]::Replace($content,$pattern,$newBlock, [System.Text.RegularExpressions.RegexOptions]::Singleline)
} else {
    # Append at the end if markers not found
    $newContent = $content + "`n`n" + $newBlock
}

Set-Content -Path $agentFile -Value $newContent -Encoding UTF8
Write-Host "sync.ps1: Agent.md actualizado con referencias a skills."

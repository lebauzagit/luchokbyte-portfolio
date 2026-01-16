<#
sync.ps1 - sync skills into Agent.md using the Scope property
Replaces the block between <!-- SKILLS-START --> and <!-- SKILLS-END -->
#>

Set-Location -Path (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
$agentFile = 'Agent.md'
if (-not (Test-Path $agentFile)) { Write-Error 'Agent.md not found'; exit 1 }

$startMark = '<!-- SKILLS-START -->'
$endMark = '<!-- SKILLS-END -->'

# Read skills
$skillPaths = Get-ChildItem -Path skills -Recurse -Filter skill.md | ForEach-Object { $_.FullName }
$scopeMap = @{}

foreach ($p in $skillPaths) {
    $lines = Get-Content -Path $p -Raw -ErrorAction SilentlyContinue -Encoding UTF8
    # Extract metadata Name:, Trigger:, Scope:, Description: from the header
    $name = ([regex]::Match($lines,'(?m)^Name:[ \t]*(.+)$')).Groups[1].Value.Trim()
    $trigger = ([regex]::Match($lines,'(?m)^Trigger:[ \t]*(.+)$')).Groups[1].Value.Trim()
    $scope = ([regex]::Match($lines,'(?m)^Scope:[ \t]*(.+)$')).Groups[1].Value.Trim()
    if (-not $scope) { $scope = 'Root' }
    $rel = $p -replace '\\','/'
    $entry = "- {0} - {1} — trigger: {2} — path: {3}" -f $scope, $name, $trigger, $rel
    if ($scopeMap.ContainsKey($scope)) {
        $scopeMap[$scope] += "`n" + $entry
    } else {
        $scopeMap[$scope] = $entry
    }
}

# Build generated block
$sb = New-Object System.Text.StringBuilder
$sb.AppendLine($startMark) | Out-Null
$sb.AppendLine('<!-- START GENERATED SKILLS: DO NOT EDIT MANUALLY -->') | Out-Null
$sb.AppendLine() | Out-Null
$sb.AppendLine('## Skills by Scope (auto-generated)') | Out-Null
$sb.AppendLine() | Out-Null
foreach ($s in @('UI','Data','Root')) {
    if ($scopeMap.ContainsKey($s)) {
        $sb.AppendLine("### $s") | Out-Null
        $sb.AppendLine($scopeMap[$s]) | Out-Null
        $sb.AppendLine() | Out-Null
    }
}
# Other scopes
foreach ($k in $scopeMap.Keys) {
    if ($k -in @('UI','Data','Root')) { continue }
    $sb.AppendLine("### $k") | Out-Null
    $sb.AppendLine($scopeMap[$k]) | Out-Null
    $sb.AppendLine() | Out-Null
}
$sb.AppendLine('<!-- END GENERATED SKILLS -->') | Out-Null
$sb.AppendLine($endMark) | Out-Null

# Replace block in Agent.md
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
Write-Host "sync.ps1: Agent.md updated with skills references."

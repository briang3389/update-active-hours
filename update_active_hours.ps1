$registryPath = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"

if (Test-Path -Path "${registryPath}") {
  $currentHour = (Get-Date).hour
  $activeHoursStart = $currentHour
  $activeHoursEnd = $activeHoursStart + 18
  if ($activeHoursEnd -gt 23) {
    $activeHoursEnd = $activeHoursEnd - 24
  }
  Set-ItemProperty -Path "${registryPath}" -Name "ActiveHoursStart" -Value "${activeHoursStart}"
  Set-ItemProperty -Path "${registryPath}" -Name "ActiveHoursEnd" -Value "${activeHoursEnd}"
}

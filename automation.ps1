
<#checks if script is running in admin shell, and if not relaunches in admin#>
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}


<#checks if time zone is EST and if not sets timezone to est#>
Write-Output("`nChecking Timezone")

start-sleep 1

$time = Get-TimeZone

if ($time.Id -ne "eastern standard time"){

  Write-Output("`nTimezone is $time.")

  start-sleep 1

  Set-TimeZone -Id "`nEastern Standard Time"

  Write-Output("`nSetting timezone to EST")

} else{

  Write-Output("`nTimezone is $time.")}

  start-sleep 1

Write-Output("`n")

& cmd.exe /c netsh wlan add profile wifi_profile.xml

Remove-Module PSWindowsUpdate

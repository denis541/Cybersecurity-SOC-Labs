# 1.Environment Assessment
Before making changes, verify the current restrictions across all scopes `(Machine, User, and Process).`
`Get-ExecutionPolicy:` Displays the active policy for the current session.
`Get-ExecutionPolicy -List: `Provides a detailed breakdown of policies at every level of the system hierarchy.
# 2. Policy Modification
Use these to change the persistent security posture of the system.
`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser:` The recommended balance for analysts. It allows you to run your own local scripts without a digital signature while blocking unsigned scripts downloaded from the internet.
`Set-ExecutionPolicy Restricted:` The "Lockdown" command. It returns the system to the default Windows state, preventing all scripts from running.
```bash
set-executionpolicy Remotesigned
```
This command allows scripts created on the computer to run but restricts those made on other devices exept the local computer.

`Restricted` - prevents all scripts from running.

``allsigned`` -allows all scripts to run but if the have a signed signature.

`unrestricted` -runs any scripts without restriction.

# 3. The Temporary Bypass **(No Settings Changed)**
This is the preferred method for one-off executions to avoid lowering system-wide security.
`PowerShell.exe -ExecutionPolicy Bypass -File ".\FileName.ps1":` Launches a new PowerShell process that ignores all restrictions for that specific script only.
# 4. Core Utility Commands
These are the primary engine components used within your script for the actual file analysis.
`Get-FileHash:` The engine that computes the cryptographic signature of a file.
`Read-Host:` The command used to pause execution and capture user-provided file paths.

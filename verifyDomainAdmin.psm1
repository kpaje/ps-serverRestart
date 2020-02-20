function verifyDomainAdmin {
    $CurrentUser = $env:UserName | Get-ADUser
    $DomainAdminGroupMembers = Get-ADGroupMember "ITSTechs" | Select-Object SamAccountName
    $CurrentUserinDomainAdminGroup = $DomainAdminGroupMembers.SamAccountName -contains $CurrentUser.SamAccountName
          if ($CurrentUserinDomainAdminGroup -eq $false){
              Write-Host "This script must be run with Domain Administrator credentials" -ForegroundColor Red
              Write-Host "Please open PowerShell with Domain Administrator credentials and run script again" -ForegroundColor Red
              break
          } else {
            Write-Host $CurrentUser.SamAccountName "is a verified AD Member of KCLS\ITSTechs" -ForegroundColor Green
            Write-Host ''
          }
}


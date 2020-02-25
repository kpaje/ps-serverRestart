$GROUPNAME =  Get-Content -Path ./groupName.txt
$DOMAIN = 'KCLS'

function verifyDomainAdmin {
    <#
    .DESCRIPTION
        Verifies active directory user has administrative permissions
    #>
  [CmdletBinding()]
  # param (
  #     [Parameter()]
  #     [TypeName]
  #     $ParameterName
  # )
    $CurrentUser = $env:UserName | Get-ADUser
    $DomainAdminGroupMembers = Get-ADGroupMember $GROUPNAME | Select-Object SamAccountName
    $CurrentUserinDomainAdminGroup = $DomainAdminGroupMembers.SamAccountName -contains $CurrentUser.SamAccountName
          if ($CurrentUserinDomainAdminGroup -eq $false){
              Write-Host "This script must be run with Domain Administrator credentials" -ForegroundColor Red
              Write-Host "Please open PowerShell with Domain Administrator credentials and run script again" -ForegroundColor Red
              break
          } else {
            Write-Host $CurrentUser.SamAccountName "is a verified AD Member of $DOMAIN\$GROUPNAME" -ForegroundColor Green
            Write-Host ''
          }
}


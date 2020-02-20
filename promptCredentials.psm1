function promptCredentials {
    $username = Read-Host "INPUT USERNAME"
    $password = Read-Host "INPUT PASSWORD" -AsSecureString
    $CREDENTIALS = New-Object -typename System.Management.Automation.PSCredential `
        -argumentlist $username, $password

    # Get current domain using logged-on user's credentials
    $AdUser = $CREDENTIALS.GetNetworkCredential().UserName
    $AdPassword = $CREDENTIALS.GetNetworkCredential().Password
    $CurrentDomain = "LDAP://" + ([ADSI]"").distinguishedName
    $domain = New-Object System.DirectoryServices.DirectoryEntry($CurrentDomain, $AdUser, $AdPassword)

    Write-Host "Verifying"
    Write-Host "UserName - KCLS\$adUser" -ForegroundColor Magenta
    Write-Host "Password - $password" -ForegroundColor Magenta

    if ($domain.Username -eq $null) {
        Write-Host "Authentication failed - please verify your username and password." -ForegroundColor Red
        exit #terminate the script.
    } else {
        Write-Host "Successfully authenticated with domain" -ForegroundColor Green
    }
}
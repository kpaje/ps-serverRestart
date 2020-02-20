function promptCredentials {
    $inputUserName = Read-Host "INPUT USERNAME"
    $USERNAME = "KCLS\$inputUserName"

    $inputPassword = Read-Host "INPUT PASSWORD" -AsSecureString
    $ENCRYPTION = ConvertFrom-SecureString -SecureString $inputPassword
    $ENCRYPTPASSWORD = ConvertTo-SecureString -String $ENCRYPTION -AsPlainText -Force
    $SECUREPASSWORD = ConvertTo-SecureString $ENCRYPTPASSWORD -AsPlainText -Force

    $CREDENTIALS = new-object -typename System.Management.Automation.PSCredential `
        -argumentlist $USERNAME, $SECUREPASSWORD

    Write-Host "LOGON VERIFICATION" -ForegroundColor Magenta -NoNewline 
    $CREDENTIALS.GetNetworkCredential() | Format-List -Property *
}
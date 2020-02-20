Import-Module .\promptCredentials.psm1
Import-Module .\promptMenu.psm1
Import-Module .\common.psm1
$SERVERLIST = Get-Content -Path .\ServerList.txt

function runApp {
    promptMenu
    promptCredentials
    startUpMessage

    foreach ($SERVER in $SERVERLIST) {
        restartServer -server $SERVER

        if (Test-Connection $SERVER -Quiet) {
            Write-Host -Verbose "Testing $SERVER connection" -ForegroundColor Green
            testConnection -server $SERVER
            Write-Host "Checking $SERVER LPTone and PCRes services" -ForegroundColor Green
            checkServices -server $SERVER
            Write-Host "$SERVER has successfully rebooted!" -ForegroundColor Green 
        }
        else {
            Test-Connection  $SERVER
            Write-Verbose -Message "$SERVER, awaiting conection"
        }
    }
}

runApp
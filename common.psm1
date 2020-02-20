function startUpMessage {
    Write-Host "RESTART ALL THE THINGS!!!" -Verbose -ForegroundColor Yellow
    Write-Host "Attempting to restart..." -Verbose -ForegroundColor Yellow
}

function checkServices {
    param(
        [Parameter(Mandatory = $True)]  
        [String]
        $server
    )
    $SERVICES = 'lptclient', 'LPT:One Job Queue Engine', 'ewSystemMonitor', 'PCReservationManagementService'
    Get-Service -Name $SERVICES -ComputerName $server
}

function restartServer {
    param (
        [Parameter(Mandatory = $True)]  
        [String]
        $server
    )
    Restart-Computer -ComputerName $server -Force -WhatIf 
}

function testConnection {
    param(
        [Parameter(Mandatory = $True)]
        [String]
        $server
    )
    Test-Connection -ComputerName $server -Verbose
}
function startUpMessage {
    [CmdletBinding()]
    # param (
    #     [Parameter()]
    #     [TypeName]
    #     $ParameterName
    # )
    Write-Host "Attempting to restart..." -Verbose -ForegroundColor Yellow
}

function checkServices {
    [CmdletBinding()]
    param (
        [Parameter()]
        [TypeName]
        $ParameterName
    )

    $SERVICES = 'lptclient', 'LPT:One Job Queue Engine', 'ewSystemMonitor', 'PCReservationManagementService'
    Get-Service -Name $SERVICES -ComputerName $server
}

function restartServer {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True)]  
        [String]
        $server
    )
    Restart-Computer -ComputerName $server -Force -WhatIf 
}

function testConnection {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $True)]
        [String]
        $server
    )
    Test-Connection -ComputerName $server -Verbose
}
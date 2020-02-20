function promptMenu {
    $TITLE = Write-Host "KCLS ITS SERVER RESTART SCRIPT" -ForegroundColor DarkYellow
    $INFO = Write-Host "Select one server or all servers" -ForegroundColor Blue

    $ONESERVER = New-Object System.Management.Automation.Host.ChoiceDescription "&ONE_Server", `
        "Reboots ONE jqe server"
    $ALLSERVERS = New-Object System.Management.Automation.Host.ChoiceDescription "&ALL_Servers", `
        "Reboots ALL jqe servers"
    $QUIT = New-Object System.Management.Automation.Host.ChoiceDescription "&Quit", `
        "Exit Application"

    $OPTIONS = [System.Management.Automation.Host.ChoiceDescription[]] @($ONESERVER, $ALLSERVERS, $QUIT)
    [int]$DEFAULTCHOICE = 2 #&Quit
    $prompt = $host.UI.PromptForChoice($TITLE , $INFO , $OPTIONS, $DEFAULTCHOICE)
    switch ($prompt) {
        0 { "One Server"; break }
        1 { "All Servers"; break }
        2 { Write-Host "GOODBYE" -ForegroundColor Cyan }
    }

}
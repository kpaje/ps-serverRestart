function promptMenu {
    <#
    .DESCRIPTION
        Creates a menu console prompt
    #>
    [CmdletBinding()]

    $TITLE = Write-Host "KCLS ITS SERVER RESTART SCRIPT" -ForegroundColor DarkYellow
    $INFO = Write-Host "Select one server or all servers" -ForegroundColor Blue


    Class MenuItem {
        [String]$itemName
        [String]$itemDescription

        # constructor
        MenuItem([String]$itemName, [String]$itemDescription) {
            $this.itemName = $itemName
            $this.itemDescription = $itemDescription
        }

        [MenuItem]Create($itemName, $itemDescription) {
            return New-Object System.Management.Automation.Host.ChoiceDescription $itemName, `
                $itemDescription
        }
    }
    $OneServer = [MenuItem]::Create("&ONE_Server", "Reboots ONE jqe server")
    $AllServers = [MenuItem]::Create("&ALL_Servers", "Reboots ALL jqe servers")
    $Quit = [MenuItem]::Create("&Quit", "Exit Application")


    # $ONESERVER = New-Object System.Management.Automation.Host.ChoiceDescription "&ONE_Server", `
    #     "Reboots ONE jqe server"
    # $ALLSERVERS = New-Object System.Management.Automation.Host.ChoiceDescription "&ALL_Servers", `
    #     "Reboots ALL jqe servers"
    # $QUIT = New-Object System.Management.Automation.Host.ChoiceDescription "&Quit", `
    #     "Exit Application"

    $OPTIONS = [System.Management.Automation.Host.ChoiceDescription[]] @($OneServer, $AllServers, $Quit)
    [int]$DEFAULTCHOICE = 2 #&Quit
    $prompt = $host.UI.PromptForChoice($TITLE , $INFO , $OPTIONS, $DEFAULTCHOICE)
    switch ($prompt) {
        0 { Write-Host "RESTART ALL THE THINGS!!!" -Verbose -ForegroundColor DarkGreen; break }
        1 { "All Servers"; break }
        2 { Write-Host "GOODBYE" -ForegroundColor Cyan }
    }

}
Function Write-Line
    {
        [CmdletBinding()]
        [OutputType("Void")]
        Param
        (
            [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)][Alias("O", "I")][object]$Object,
            [Parameter(Mandatory = $False, Position = 1)][Alias("F", "FC")] [ConsoleColor]$ForegroundColor = (Get-Host).UI.RawUI.ForegroundColor,
            [Parameter(Mandatory = $False, Position = 2)][Alias("B", "BC")] [ConsoleColor]$BackgroundColor = (Get-Host).UI.RawUI.BackgroundColor,
            [Parameter(Mandatory = $False, Position = 3)][Alias("NNL")] [Switch]$NoNewline
        )

        If (([int]$ForegroundColor) -eq -1)
        {
            $ForegroundColor = [ConsoleColor]::White;
        }

        If (([int]$BackgroundColor) -eq -1)
        {
            Write-Host -NoNewline:$NoNewline -ForegroundColor $ForegroundColor -Object $Object;
        }
        Else
        {
            Write-Host -NoNewline:$NoNewline -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor -Object $Object;
        }
    }
function Get-SFXToolkit {
    <#
        .SYNOPSIS
            Returns a detailed listing of all Commands in the 'SFX.PoshUtilities.PSToolsSuite' Module.

        .DESCRIPTION
            Returns a detailed listing of all Commands in the 'SFX.PoshUtilities.PSToolsSuite' Module, with a description and the name of the Module they are sourced from.

        .PARAMETER Module
            Specifies an 'SFX.PoshUtilities' Module to list Commands for. 

        .EXAMPLE
            PS C:\> Get-SFXToolkit

        .EXAMPLE
            PS C:\> Get-SFXToolKit -Module PSObjectTools

        .LINK
            https://gothub.com/SupernautFX/SFX.PoshUtilities.PSToolsSuite

        .NOTES
            Filename: 'Get-SFXToolkit.ps1'
            Version: 0.7.12
            Author: Nathaniel W. P.
    #>
    [CmdletBinding()]
    param(
        [Parameter(
            Position = 0
        )]
        [ValidateSet('All', 'PSObjectTools', 'SFX.PoshUtilities.PSObjectTools', 'DataFileTools', 'SFX.PoshUtilities.DataFileTools', 'PSProfileTools', 'SFX.PoshUtilities.PSProfileTools')]
        [string]$Module = 'All'
    )

    if ($Module -eq 'All') {
        Write-Information "Command Listing for ALL SFX.PoshUtilities Modules..." -Verbose
        Write-PSObject -Object $Private:SFXPoshUtilitiesCmdAll 
    } elseif ($Module -eq 'All') {
        Write-Information "Command Listing for SFX.PoshUtilities.PSProfileTools..." -Verbose
        return $Private:SFXPoshUtilitiesCmdPSProfileTools
    } elseif ($Module -eq 'All') {
        Write-Information "Command Listing for SFX.PoshUtilities.DataFileTools..." -Verbose
        return $Private:SFXPoshUtilitiesCmdDataFileTools
    } elseif ($Module -eq 'All') {
        Write-Information "Command Listing for SFX.PoshUtilities.PSObjectTools..." -Verbose
        return $Private:SFXPoshUtilitiesCmdPSObjectTools
    }

    Write-Warning -Message "This Command is currently a WORK IN PROGRESS and as such may appear UNFINISHED lacking certain features. 'Get-SFXToolkit' will be updated AS SOON AS POSSIBLE!"
    Write-Information -MessageData "As of SFX.PoshUtilities.PSToolsSuite Version 0.0.51"
    Write-Host "- " -ForegroundColor Gray -NoNewline
    Write-Host "SFXDev" -ForegroundColor Magenta
    Write-Output " "
    Write-Host "[DEV] For Project Updates please visit:" -ForegroundColor White -NoNewline
    Write-Host " https://github.com/SupernautFX/SFX.PoshUtilities.PSToolsSuite" -ForegroundColor Yellow 
}
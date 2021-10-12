function ConvertFrom-PSSDataFile {
    <#
		.SYNOPSIS
	    	Imports and Converts the contents of a PowerShell Data File into a Hashtable.

		.DESCRIPTION
	    	Imports the contents of a PowerShell Data File and converts them into a hashtable Object,

		.PARAMETER FilePath
	    	Specifies the path to a PowerShell Data File (*.psd1).

		.PARAMETER FileRoot
			Specifies the path to a Directory containing multiple PowerShell Data Files (*.psd1).

		.EXAMPLE
			PS C:\> ConvertFrom-PSDataFile -FilePath 'C:\test\SomeFolder\Data.psd1'

		.EXAMPLE
			PS C:\> ConvertFrom-PSDataFile -FileRoot 'C:\test\SomeFolder'

		.LINK
			https://github.com/SupernautFX/SFX.PoshUtilities.PSDataFileTools

		.NOTES
			Filename: 'ConvertFrom-PSDataFile.ps1'
			Version: 1.0.0
			Author: Nathaniel Wallis Praytor
    #>

	[CmdletBinding(DefaultParameterSetName = 'File')]
	param(
		[Parameter(Mandatory, ParameterSetName = 'File')]
		[string]$FilePath,

		[Parameter(Mandatory, ParameterSetName = 'Directory')]
		[string]$FileRoot
	)

	BEGIN {
		if ($FilePath.IsPresent) {
			$PSDataFile = Get-Content $FilePath
			Write-Verbose ("Converting PowerShell Data File to Hashtable {0}" -f $FilePath.FullName)
		} elseif ($FileRoot.IsPresent) {
			$PSDataFile = Get-ChildItem $FileRoot -Include *.psd1 -Recurse
			Write-Verbose ("Converting PowerShell Data File(s) in Directory to Hashtable {0}" -f $FileRoot)
		}

		$PSData = New-Object hashtable
	}

	PROCESS {
		ForEach ($DataFile in $PSDataFile) {
			Try {
				$BaseName = $DataFile.Name.Split('.')[0]
				if ($PSEdition -eq 'Desktop') {
					$DataFile.BaseName = (Import-LocalizedData -Path $DataFile.FullName)
				} elseif ($PSEdition -eq 'Core') {
					$DataFile.BaseName = (Import-PowerShellDataFile -Path $DataFile.FullName)
				}
			} Catch {
				Write-Error -Message "Failed to create Hashtable from PowerShell Data File: $($DataFile.FullName): $_" -ErrorId "CONVERT-ERROR-0000" -TargetObject $($DataFile.FullName) -ErrorAction Stop
			}
		}
	}

	END {
		Write-Verbose "Finished creating Hashtable from PowerShell Data File."
	}

}

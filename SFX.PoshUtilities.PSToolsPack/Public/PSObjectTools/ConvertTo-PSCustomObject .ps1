function ConvertTo-PSCustomObject {
    <#
        .SYNOPSIS
            Converts structured Data in Json format to a PSCustomObject.

        .DESCRIPTION
            Converts structured Data, either from a Json file, or Json formatted string, to a PSCustomObject.

        .PARAMETER Name
            Specifies a Name for the newly formatted PSCustomObject. This Name is used to create a Variable which is then used to reference the Object.

        .PARAMETER FilePath
            Specifies the Path to a Json or Jsonc file to be converted to a PSCustomObject.

        .PARAMETER StringData
            Specifies a Json formatted string to convert to a PSCustomObject.

        .EXAMPLE
            PS C:\> ConvertTo-PSCustomObject -Name 'MyPSCustomObject' -FilePath 'C:\test\object_data.json'

        .EXAMPLE
            PS C:\> $json = @"{
                "Settings": [{"DefaultLogPath": "C:\\temp\\logfile.log"},
                {"DefaultLogLevel": "INFO"}]
            }"@ 
            ConvertTo-PSCustomObject -Name 'MyObject' -StringData $json

        .LINK
            https://github.com/SupernautFX/SFX.PoshUtilities.PSObjectTools

        .NOTES
            Filename; 'ConvertTo-PSCustomObject.ps1'
            Version: 0.5.1
            Author: Nathaniel W. P.

        .FORWARDHELPTARGETNAME ConvertTo-PSCustomObject
        .FORWARDHELPCATEGORY Function
        .EXTERNALHELP ConvertTo-PSSCustomObject.ps1-help.xml
    #>
    [CmdletBinding(SupportsShouldProcess, DefaultParameterSetName = 'Default')]
    param(
        [Parameter(
             Mandatory,
             ParameterSetName = 'Default'
         )]
         [string]$Name,
        
         [Parameter(ParameterSetName = 'Default')]
         [Parameter(ParameterSetName = 'FileSource')]
         [string]$FilePath,
        
         [Parameter(ParameterSetName = 'Default')]
         [Parameter(ParameterSetName = 'StringSource')]
         [string]$StringData
            
    )

    PROCESS {
        if ($FilePath.IsPresent) {
            $pscObject = Get-Content -Path $FilePath | ConvertFrom-Json
        }
        elseif ($StringData.IsPresent) {
            $pscObject = $StringData | ConvertFrom-Json
        }
    }
    

}

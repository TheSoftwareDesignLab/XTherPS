param([bool]$generateJacocoFile=$True)
     

#Get current location
$ProjectRoot = [System.IO.Path]::GetDirectoryName($PSCommandPath)

#
# run pester tests for the XTherPS project
#
function RunXTherPSTests
{
    #Run tests with code coverage
    $CodeFiles = (Get-ChildItem $ProjectRoot/src -Recurse -Include "*.psm1","*.ps1").FullName

    if ($generateJacocoFile) 
    {
        $Script:TestResults = Invoke-Pester -Path $ProjectRoot/tests -CodeCoverage $CodeFiles -PassThru -OutputFormat NUnitXml -OutputFile "$ProjectRoot\testResults.xml" -ExcludeTag 'e2e' -CodeCoverageOutputFile "$ProjectRoot\codeCoverage.xml"
    } 
    else 
    {
        $Script:TestResults = Invoke-Pester -Path $ProjectRoot/tests -CodeCoverage $CodeFiles -PassThru -OutputFormat NUnitXml -OutputFile "$ProjectRoot\testResults.xml" -ExcludeTag 'e2e'
    }

    #change location again
    Set-Location $ProjectRoot
}

#
# Main: Entry point
#
RunXTherPSTests
#Get current location
$ProjectRoot = [System.IO.Path]::GetDirectoryName($PSCommandPath)

#
# run pester tests for the XTherPS project
#
function RunXTherPSTests()
{
    #Run tests with code coverage
    $CodeFiles = (Get-ChildItem $ProjectRoot/src -Recurse -Include "*.psm1","*.ps1").FullName

    $Script:TestResults = Invoke-Pester -Path $ProjectRoot/tests -CodeCoverage $CodeFiles -PassThru -OutputFormat NUnitXml -OutputFile "$ProjectRoot\testResults.xml" -ExcludeTag 'e2e' -CodeCoverageOutputFile "$ProjectRoot\codeCoverage.xml"

    #change location again
    Set-Location $ProjectRoot
}

#
# Update the code coverage percent
#
function Update-CodeCoveragePercent 
{ 
    [cmdletbinding(supportsshouldprocess)]
    param(
        [int]
        $CodeCoverage = 0,

        [string]
        $TextFilePath = "$ProjectRoot\Readme.md"
    )

    $BadgeColor = switch ($CodeCoverage) {
        {$_ -in 90..100} { 'brightgreen' }
        {$_ -in 75..89}  { 'yellow' }
        {$_ -in 60..74}  { 'orange' }
        default          { 'red' }
    }

    if ($PSCmdlet.ShouldProcess($TextFilePath)) {
        $ReadmeContent = (Get-Content $TextFilePath)
        $ReadmeContent = $ReadmeContent -replace "!\[Test Coverage\].+\)", "![Test Coverage](https://img.shields.io/badge/coverage-$CodeCoverage%25-$BadgeColor.svg?maxAge=60)" 
        $ReadmeContent | Set-Content -Path $TextFilePath
    }
}

#
# Calculates the code coverage percent
#
function GetPercentCovered
{
    $CoveragePercent = [math]::floor(100 - (($Script:TestResults.CodeCoverage.NumberOfCommandsMissed / $Script:TestResults.CodeCoverage.NumberOfCommandsAnalyzed) * 100))

    return $CoveragePercent
}

#
# print final coverage file
#
function BuildAndTestProcess
{
    RunXTherPSTests
    
    $codeCoveragePercent = GetPercentCovered

    Update-CodeCoveragePercent -CodeCoverage $codeCoveragePercent
}

#
# Main: Entry point
#
BuildAndTestProcess
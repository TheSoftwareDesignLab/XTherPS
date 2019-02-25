#Get current location
$ProjectRoot = [System.IO.Path]::GetDirectoryName($PSCommandPath)

#Run tests
$CodeFiles = (Get-ChildItem $ProjectRoot/src -Recurse -Include "*.psm1","*.ps1").FullName

$Script:TestResults = Invoke-Pester -Path $ProjectRoot/tests -CodeCoverage $CodeFiles -PassThru -OutputFormat NUnitXml -OutputFile "$ProjectRoot\testResults.xml" -ExcludeTag e2e

#change location again
Set-Location $ProjectRoot
#
# MIT License
#
# Copyright 2019 GreenSQA & The software design LAB (Uniandes)
#
# Permission is  hereby granted,  free of charge,  to any person obtaining a 
# copy of this software and associated documentation files (the "Software"), 
# to deal in the Software  without restriction, including without limitation 
# the rights to use, copy, modify,  merge, publish,  distribute, sublicense, 
# and/or sell copies  of the Software, and  to permit persons  to whom  the 
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright  notice and this permission notice  shall be included 
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
# IMPLIED, INCLUDING BUT NOT  LIMITED TO THE WARRANTIES  OF  MERCHANTABILITY, 
# FITNESS FOR  A  PARTICULAR  PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL 
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR  ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
# OUT OF OR IN CONNECTION WITH  THE SOFTWARE  OR THE USE OR OTHER DEALINGS IN 
# THE SOFTWARE.
#
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Script purpose:
#
# Crossplatform Libraries for quering the download url of Selenium Stand Alone
# Server, maintaining the compatibility between: 
#     - OS
#     - OS Architecture
#     - Browser version
# and returns the download url for the webdriver
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#

#
# Gets the Major.Minor installed java version
#
function GetInstalledJavaVersion
{
	$terminalOutput = [string](java -version 2>&1)

	[string]$javaVersion = ([regex]'"(\d+.\d+)').Match($terminalOutput).Captures[0].value
	
	$javaVersion = $javaVersion.Substring(1)
	
	return $javaVersion;
}

#
# Returns a boolean indicating if the java version installed is 
# between lower requiered version and higher requiered version
#
function IsValidJavaVersion([string]$installedJavaVersion, [String]$minVersion, [String]$maxVersion)
{
	$lowValid = $False
	$higValid = $False		
	[System.Version]$minVersionReq = $minVersion

	if ([System.Version]$minVersionReq -le [System.Version]$installedJavaVersion) {
		$lowValid = $True
	}

	if ($maxVersion.Equals("LST")) {
		$higValid = $True
	} 
	else {
		[System.Version]$maxVersionReq = $maxVersion

		if (System.Version]$installedJavaVersion -le [System.Version]$maxVersionReq) {
			$higValid = $True
		}
	}

	return ($lowValid -And $higValid)
}

#
# Finds the SELENIUM STAND ALONE download URL 
# swtich the current platform settings
#
function FindSeleniumStandAloneDownloadURL($dataRow, $installedJavaVersion)
{
	$rowFields = $dataRow.Split(";") 
	[string]$foundURL = "Selenium_$errorDriverNotFound";

	# Validate Java Version
	[String]$lowJavaVersion = $rowFields[$idxJavaVer].Split("-")[0]
	[String]$higJavaVersion = $rowFields[$idxJavaVer].Split("-")[1]	
	[bool]$isProperVersion = IsValidJavaVersion $installedJavaVersion $lowJavaVersion.ToUpper().Trim() $higJavaVersion.ToUpper().Trim()
	
	if ($isProperVersion) {
		$foundURL = $rowFields[$idxDrivrURL]
	}
	
	return $foundURL
}
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
# Crossplatform Libraries for quering the download url of Edge
# webdriver, maintaining the compatibility between: 
#     - OS
#     - OS Architecture
#     - Browser version
#
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#

#
# Reads the browser edge.exe file's attributes and extracts the full version number
#
function GetEdgeVersionInWindows()
{
	$useEdgePath = "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe"
	$edgeVersionNum = ""

	if((Test-Path -Path $useEdgePath)) 
	{	
		$data = Get-ItemProperty -Path $useEdgePath | Format-list -Property VersionInfo | Out-String
		$edgeVersionNum = ([regex]"(\d+.\d+.\d+)").Match($data).Captures[0].value	
	}
	else 
	{
		Write-Output "No se encontro la siguiente ruta: $useEdgePath"
		$edgeVersionNum = "Version Not Found"
	}

	return $edgeVersionNum
}

# Given current OS, invokes the proper function to extract the edge browser full version number
#
function GetEdgeVersionCrossPlatform()
{
	$edgeVersion = "none.yet"
	$myOsName = GetOsName

	if ($myOsName.Equals("WIN")) {
		$edgeVersion = GetEdgeVersionInWindows
	}

	return $edgeVersion
}

#
# Given the full Edge browser version number, extracts the major version number
#
function GetEdgeMajorVersionSwitchFullVersionNumber([String]$fullVersionNum)
{
	$majorVer = "none.yet"

	$myRegEx = ([regex]"(\d+)")

	$majorVer = $myRegEx.Match($fullVersionNum).Captures[0].value

	return $majorVer
}


#
# If EDGE datarow is compatible with current environment and
# the webdriver version is between the low and high browser version
# then returns the MicrosoftWebDriver.exe download url
#
function GetEdgeDownloadURLIfCompatible($edgeDataRow, $fullVersion)
{
	$rowFields = $edgeDataRow.Split(";") 
	$foundURL = "EDGE_$errorDriverNotFound";
	$low = [convert]::ToInt32($rowFields[$idxBrowsVer].Split("-")[0], 10)
	$hig = [convert]::ToInt32($rowFields[$idxBrowsVer].Split("-")[1], 10)		
	$majorVersion = GetEdgeMajorVersionSwitchFullVersionNumber $fullVersion
	$osArchitecture = GetOsArchitecture
	[string]$repoArchitecture = $rowFields[$idxOSArch]
	
	if (([convert]::ToInt32($majorVersion, 10) -In $low .. $hig) -And 
		($repoArchitecture.Equals($osArchitecture)))
	{
		$env:SE_DRVR_FMT = $rowFields[$idxFormatPk]
		$foundURL = $rowFields[$idxDrivrURL]
	}
	
	return $foundURL
}
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
# Crossplatform Libraries for quering the download url of Firefox
# webdriver, maintaining the compatibility between: 
#     - OS
#     - OS Architecture
#     - Browser version
# and returns the download url for the webdriver
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#

#
# Reads the browser firefox.exe file's attributes and extracts the full version number
#
function GetFireFoxVersionInWindows()
{
	$useFireFoxPath = "C:\Program Files\Mozilla Firefox\firefox.exe"
	$firefoxVersionNum = ""
	
	if((Test-Path -Path $useFireFoxPath)) 
	{
		$data = Get-ItemProperty -Path $useFireFoxPath | Format-list -Property VersionInfo | Out-String
		$firefoxVersionNum = ([regex]"(\d+.\d+.\d+)").Match($data).Captures[0].value
	
	}else 
	{
		Write-Output "No se encontro la siguiente ruta: $useFireFoxPath"
		$firefoxVersionNum = "Version Not Found"
	}

	return $firefoxVersionNum
}

#
# Reads the browser [Fire Fox.app] file's content and extracts the X.Y version number
#
function GetFireFoxVersionInMacOS()
{

	$firefoxVersionNumb =""
	$data = cat "/Applications/Firefox.app/Contents/MacOS/Firefox"

	if(!$data -eq "") 
	{	
		$firefoxVersionNumb = ([regex]"version=(\d+.\d)").Match($data).Captures[0].value
		$firefoxVersionNumb = [string]$firefoxVersionNumb.Split("=")[1]

	}else 
	{
		Write-Output "No se encontro la siguiente ruta: $data"
		$firefoxVersionNumb = "Version Not Found"
	}

	return $firefoxVersionNumb
}

#
# Reads the browser [Fire Fox] file's content and extracts the full version number
#
function GetFireFoxVersionInLinux()
{
	
	$firefoxVersionNum =""
	$fireFoxPath = Invoke-Expression "which firefox"
	
	if((!$fireFoxPath -eq "")) 
	{
		$data = Invoke-Expression "$fireFoxPath --version"
		$firefoxVersionNum = ([regex]"(\d+.\d+)").Match($data).Captures[0].value

	}else 
	{
		Write-Output "No se encontro la siguiente ruta: $fireFoxPath"
		$firefoxVersionNum = "Version Not Found"
	}
	
	return $firefoxVersionNum
}


# Given current OS, invokes the proper function to extract chrome browser full version number
#
function GetFireFoxVersionCrossPlatform()
{
	$firefoxVersion = "none.yet"
	$myOsName = GetOsName

	if ($myOsName.Equals("WIN")) {
		$firefoxVersion = GetFireFoxVersionInWindows
	}

	if ($IsMacOS) {
		$firefoxVersion = GetFireFoxVersionInMacOS
	}

	if ($IsLinux) {
		$firefoxVersion = GetFireFoxVersionInLinux
	}

	return $firefoxVersion
}


#
# Given the full Firefox browser version number, extracts the major version number
#
function GetFireFoxMajorVersionSwitchFullVersionNumber([String]$fullVersionNum)
{
	$majorVer = "none.yet"

	$myRegEx = ([regex]"(\d+)")

	$majorVer = $myRegEx.Match($fullVersionNum).Captures[0].value

	return $majorVer
}

#
# Finds the FIREFOX download URL swtich the current platform settings
#
function FindFireFoxDownloadURL($dataRow, $fullVersion)
{
	$rowFields = $dataRow.Split(";") 
	$foundURL = "FireFox_$errorDriverNotFound";
	$low = [convert]::ToInt32($rowFields[$idxBrowsVer].Split("-")[0], 10)
	$hig = [convert]::ToInt32($rowFields[$idxBrowsVer].Split("-")[1], 10)		
	$majorVersion = GetFireFoxMajorVersionSwitchFullVersionNumber $fullVersion
	$osArchitecture = GetOsArchitecture
	[string]$repoArchitecture = $rowFields[$idxOSArch]
	
	if (([convert]::ToInt32($majorVersion, 10) -In $low .. $hig) -And 
		($repoArchitecture.Equals($osArchitecture))
	){
		$env:SE_DRVR_FMT = $rowFields[$idxFormatPk]
		$foundURL = $rowFields[$idxDrivrURL]
	}
	
	return $foundURL
}
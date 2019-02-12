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
# Crossplatform Libraries for quering the download url of Chrome
# webdriver, maintaining the compatibility between: 
#     - OS
#     - OS Architecture
#     - Browser version
# and returns the download url for the webdriver
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#


#
# Reads the browser chrome.exe file's attributes and extracts the full version number
#
function GetChromeVersionInWindows()
{
	$useChromePath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
	$chromeVersionNum =""

	if((Test-Path -Path $useChromePath)) 
	{
		$data = Get-ItemProperty -Path $useChromePath | Format-list -Property VersionInfo | Out-String	
		$chromeVersionNum = ([regex]"(\d+.\d+.\d+.\d+)").Match($data).Captures[0].value

	}else 
	{
		Write-Output "No se encontro la siguiente ruta: $useChromePath"
		$chromeVersionNum = "Version Not Found"
	}
	
	return $chromeVersionNum
}

#
# Reads the browser [Google Chrome.app] file's content and extracts the full version number
#
function GetChromeVersionInMacOS()
{	
	$chromeVersionNum =""
	$data = cat "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

	if(!$data -eq "") 
	{	
		$chromeVersionNum = ([regex]"(\d+.\d+.\d+.\d+)").Match($data).Captures[0].value

	}else 
	{
		Write-Output "No se encontro la siguiente ruta: $data"
		$chromeVersionNum = "Version Not Found"
	}
	return $chromeVersionNum
}

#
# Reads the browser [Google Chrome.app] file's content and extracts the full version number
#
function GetChromeVersionInLinux()
{
	$chromeVersionNum =""
	$chromePath = Invoke-Expression "which google-chrome"
	
	if(!($chromePath -eq "")) 
	{
		$data = Invoke-Expression "$chromePath --version"
		$chromeVersionNum = ([regex]"(\d+.\d+.\d+.\d+)").Match($data).Captures[0].value

	}else 
	{
		Write-Output "No se encontro la siguiente ruta: $chromePath"
		$chromeVersionNum = "Version Not Found"
	}
	return $chromeVersionNum
}

#
# Given the full chrome browser version number, extracts the major version number
#
function GetChromeMajorVersionSwitchFullVersionNumber([String]$fullVersionNum)
{
	$majorVer = "none.yet"

	$myRegEx = ([regex]"(\d+)")

	$majorVer = $myRegEx.Match($fullVersionNum).Captures[0].value

	return $majorVer
}

#
# Given current OS, invokes the proper function to extract chrome browser full version number
#
function GetChromeVersionCrossPlatform()
{
	$chrVersion = "none.yet"
	$myOsName = GetOsName

	if ($myOsName.Equals("WIN")) {
		$chrVersion = GetChromeVersionInWindows
	}

	if ($IsMacOS) {
		$chrVersion = GetChromeVersionInMacOS
	}

	if ($IsLinux) {
		$chrVersion = GetChromeVersionInLinux
	}

	return $chrVersion
}

#
# Finds the CHROME download URL swtich the current platform settings
# the download url is between the low and high browser version
#
function FindChromeDownloadURL($dataRow, $fullVersion)
{
	$rowFields = $dataRow.Split(";") 
	$foundURL = "Chrome_$errorDriverNotFound";
	$low = [convert]::ToInt32($rowFields[$idxBrowsVer].Split("-")[0], 10)
	$hig = [convert]::ToInt32($rowFields[$idxBrowsVer].Split("-")[1], 10)		
	$majorVersion = GetChromeMajorVersionSwitchFullVersionNumber $fullVersion

	if ([convert]::ToInt32($majorVersion, 10) -In $low .. $hig)
	{
		$foundURL = $rowFields[$idxDrivrURL]
	}

	return $foundURL
}
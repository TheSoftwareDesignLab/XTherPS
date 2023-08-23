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
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#

#
# Reads the browser chrome.exe file's attributes and extracts the full version number
#
function GetChromeVersionInWindows()
{
	$useChromePath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
	$useChromePathx64 = "C:\Program Files\Google\Chrome\Application\chrome.exe"
	$chromeVersionNum =""
	$data=""
	
	if((Test-Path -Path $useChromePath))
	{
		$data = Get-ItemProperty -Path $useChromePath | Format-list -Property VersionInfo | Out-String	
	}elseif((Test-Path -Path $useChromePathx64))
	{
		 $data = Get-ItemProperty -Path $useChromePathx64 | Format-list -Property VersionInfo | Out-String
	}
	
	if(!($data -eq "")) 
	{
		$chromeVersionNum = ([regex]"(\d+.\d+.\d+.\d+)").Match($data).Captures[0].value
	}
	else 
	{
		Write-Output "Path not found: $useChromePath"
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
	$useChromePath = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
	
	if((Test-Path -Path $useChromePath)) 
	{
		$data = cat $useChromePath

		if(!$data -eq "") {	
			$chromeVersionNum = ([regex]"(\d+.\d+.\d+.\d+)").Match($data).Captures[0].value
		}
	}
	else 
	{
		Write-Output "Path not found: $useChromePath"
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
	Write-Output "Chrome path is: $chromePath"
	
	if(!($chromePath -eq "")) 
	{
		$data = Invoke-Expression "$chromePath --version"
		$chromeVersionNum = ([regex]"(\d+.\d+.\d+.\d+)").Match($data).Captures[0].value
	}
	else 
	{
		Write-Output "Path not found: $chromePath"
		$chromeVersionNum = "Version Not Found"
	}

	return $chromeVersionNum
}

#
# Given the full google chrome browser version number, extracts the major version number
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

	if ($myOsName.Equals("MAC")) {
		$chrVersion = GetChromeVersionInMacOS
	}

	if ($myOsName.Equals("LNX")) {
		$chrVersion = GetChromeVersionInLinux
	}

	Write-Output "Current installed google chrome version is: $chrVersion"
	return $chrVersion
}

#
# If CHROME datarow is compatible with current environment and
# the webdriver version is between the low and high browser version
# then returns the chromedriver download url
#

function GetChromeDownloadURLIfCompatible($chromeDataRow, $fullVersion)
{
	$rowFields = $chromeDataRow.Split(";") 
	$foundURL = "Chrome_$errorDriverNotFound";
	$low = [convert]::ToInt32($rowFields[$idxBrowsVer].Split("-")[0], 10)
	$hig = [convert]::ToInt32($rowFields[$idxBrowsVer].Split("-")[1], 10)		
	$majorVersion = GetChromeMajorVersionSwitchFullVersionNumber $fullVersion

	if ([convert]::ToInt32($majorVersion, 10) -In $low .. $hig)
	{
		$foundURL = $rowFields[$idxDrivrURL]
	}

	return $foundURL, $hig
}

$foundURL, $hig = GetChromeDownloadURLIfCompatible $chromeDataRow $fullVersion

# Llamar a la función SomeOtherFunction y pasar el valor de $hig
function SomeOtherFunction($higValue)
{
    # Tu lógica aquí que utiliza $higValue
    Write-Output "El valor de hig en SomeOtherFunction es: $higValue"
}

SomeOtherFunction $hig
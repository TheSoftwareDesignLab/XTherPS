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
# Logic for quering the download url of the webdrivers
# or stand alone, maintaining the compatibility between: 
#     - OS
#     - OS Architecture
#     - Browser version
# and returns the download url for the webdriver
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#

[string]$errorDriverNotFound = "DRIVER_NOT_FOUND_FOR_CURRENT_INSTALLED_BROWSER_PLEASE_UPDATE_YOUR_BROWSER"
$logicDirectory=[System.IO.Path]::GetDirectoryName($PSCommandPath)

#
# Gets the alias representing the current operative system
#
function GetOsName()
{
	[String]$platform = "*"

	if ($null -eq $IsMacOS  -and $null -eq $IsLinux)
	{
		$platform = "WIN"
	}

	if ($IsMacOS)
	{
		$platform = "MAC"
	}

	if ($IsLinux)
	{
		$platform = "LNX"
	}

	return $platform
}

#
# Gets the operative system archichitecture 86 or 64
#
function GetOsArchitecture()
{
	return ([IntPtr]::Size*8).ToString()
}

#
# Get the version of the resource
#
function GetResourceFullVersion([string]$resourceName)
{
	$resourceFullVersion = "The resource [$resourceName] is not installed"

	try 
	{			
		if ($resourceName.Equals("CHR")) {
			$resourceFullVersion  = GetChromeVersionCrossPlatform	               
		}
		
		if ($resourceName.Equals("FIR")) {
			$resourceFullVersion  = GetFireFoxVersionCrossPlatform
		}
		
		if ($resourceName.Equals("EDG")) {
			$resourceFullVersion  = GetEdgeVersionCrossPlatform 
		}
		
		if ($resourceName.Equals("STD")) {
			$resourceFullVersion   = GetInstalledJavaVersion
		}		
	}
	catch 
	{
		write-output "The resource [$resourceName] is not installed"
	}

	return $resourceFullVersion
}

#
# Finds into the DB the download URL swtich the current platform 
# settings and the specified $resourceName
#
function QueryResourceDownloadUrlDB([string]$resourceName)
{
	[string]$foundURL = "None of our stored URLS were valid for supporting the current environment and platform"
	[string]$resourceFullVersion = GetResourceFullVersion $resourceName

	if (!$resourceFullVersion.ToUpper().Contains(("NOT FOUND")))
	{
		foreach ($row in $drvrDB.Split("`n")) 
		{
			$rowFields = $row.Split(";")

			#ignore invalid rows
			if ($rowFields.Length -le 5) { 
				continue; 
			}

			if ($rowFields[$idxDrvrName].Equals($resourceName) -and 
			($rowFields[$idxOSName].Equals($OperativeSName) -or $rowFields[$idxOSName].Equals("ALL")))
			{ 
				if ($resourceName.Equals("CHR")) {
					$foundURL = FindChromeDownloadURL $row $resourceFullVersion                
				}

				if ($resourceName.Equals("FIR")) {
					$foundURL = FindFireFoxDownloadURL $row $resourceFullVersion
				}

				if ($resourceName.Equals("EDG")) {
					$foundURL = FindEdgeDownloadURL $row $resourceFullVersion
				}

				if ($resourceName.Equals("STD")) {
					$foundURL = FindSeleniumStandAloneDownloadURL $row $resourceFullVersion
				}

				#evaluates if the url was found
				if (!$foundURL.Contains($errorDriverNotFound)) {
					$foundURL = $foundURL.Trim().Replace("´n","")
					break;
				}
			}
		}
	}

	#Clear-Host
	return "[[$foundURL]]"
}

# Import external functions
. $logicDirectory/DAL/DALUriDB.ps1
. $logicDirectory/DAL/DALStandAlone.ps1
. $logicDirectory/DAL/DALChrome.ps1
. $logicDirectory/DAL/DALFireFox.ps1
. $logicDirectory/DAL/DALEdge.ps1

#
# Gets de download URL for the specified $resourceName
# taking into account current environment platform
#
function GetResourceDownloadURL($resourceName)
{
	[string]$queriedURL=QueryResourceDownloadUrlDB -resourceName $resourceName
	
	return [string]$queriedURL
}
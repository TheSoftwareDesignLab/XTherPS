#
# MIT License
#
# Copyright 2019 GreenSQA S.A. & The software design LAB (Uniandes)
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
#  Installs the compatible Web Drivers with the installed web browsers in a target
#  machine. Also installs the latest version of the selenium stand alone server.
#
#  Examples:
#	1) Invoking example for installing Selenium stand alone and Chrome driver:
#	pwsh ./greensqa_xther/XTherPS.ps1 -resources 'STD,CHR' -installDir '/Users/eider/Documents/Selenium'
#
#	2) Invoking example for installing all XTher's suported resources:
# 	pwsh XTherPS.ps1 -resources '*' -installDir '/Users/eider/Documents/Selenium'
#
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#
param([String]$resources='STD',
	  [String]$installDir='C:/GreenSQA/AiMaps/Selenium/'
	 )

#
# Fetch required scripts of XTher
#
function XTherDownloadScripts
{
    $destinationDirectory=[System.IO.Path]::GetDirectoryName($PSCommandPath)
	
	$urlSEREsourcesDB = ""
	$urlSEResourcesInstaller = ""

	#(New-Object System.Net.WebClient).DownloadFile("$urlSEREsourcesDB", "$destinationDirectory/SEREsourcesDB.ps1")
	#(New-Object System.Net.WebClient).DownloadFile("$urlSEResourcesInstaller", "$destinationDirectory/SEResourcesInstaller.ps1")
}

#
# Executes the downloader logic
#
function XTherResourcesRunner ($myInstallDir, $myResources)
{
	#Detect which resources wants to install
	if ($myResources.Equals("*"))
	{
		$myResources = "STD,CHR,FIR,EDG"
	}

	echo "Params resurces=[$myResources]"

	#Invoke SEResourcesInstaller script
	$installerCommand = "./SEResourcesInstaller.ps1 -myDriverOutput '$myInstallDir' -myResources '$myResources'"
	echo "the installer command will be [$installerCommand]"
	$ScriptBlock = [ScriptBlock]::Create($installerCommand)	
	Invoke-Command -ScriptBlock $ScriptBlock
}

#
# Executes XTher
#
function XTherRunAll ($myInstallDir, $myResources)
{
	Write-Output "#################################################################################################################"
	Write-Output "# GreenSQA XTher by TIA Team! is installing the resources [$myResources] in [$myInstallDir]                      "
	Write-Output "#################################################################################################################"

	$stopWatch = [system.diagnostics.stopwatch]::startNew()
	$currentPath = $pwd

	try {
		XTherDownloadScripts
		XTherResourcesRunner $myInstallDir $myResources	
	}
	Catch
	{
		Write-Output $_.Exception.Message
		Write-Output $_.Exception.ItemName
	}
	Finally
	{
		Set-Location $currentPath
		$runDuration = $stopWatch.Elapsed.TotalSeconds
		Write-Output "XTherPS executed in [$runDuration] seconds"
	}
}

# Main Entrypoint
XTherRunAll $installDir $resources
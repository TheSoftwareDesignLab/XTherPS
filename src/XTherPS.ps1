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
# Installs the Web Drivers compatible with the installed web browsers into the
# running machine. Also installs the latest version of the selenium stand alone 
# server. XTherPS is develped in PowerShell Core therefore it runs on Windows, 
# Mac and Linux.
#
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#
param([String]$resources='STD',
	  [String]$installDir='C:/GreenSQA/AiMaps/Selenium/'
	 )

#
# Fetch required scripts of XTherPS
#
function XTherDownloadLogicScripts
{
	$stopWatch = [system.diagnostics.stopwatch]::startNew()
    	$destinationDirectory=[System.IO.Path]::GetDirectoryName($PSCommandPath)	
	$urlXTherIndex = "https://raw.githubusercontent.com/TheSoftwareDesignLab/XTherPS/f-10811/src/XTherPS.ps1"

	if(!(Test-Path -Path "$destinationDirectory/XTherPSIndex.ps1")) {		
		(New-Object System.Net.WebClient).DownloadFile("$urlXTherIndex", "$destinationDirectory/XTherPSIndex.ps1")

		Start-Sleep -m 1000
	}

. $destinationDirectory/XTherPSIndex.ps1

	foreach ($row in $XTherIndex.Split("`n")) 
	{
		$rowFields = $row.Split(";")
		
		#ignore invalid rows
		if ($rowFields.Length -le 2) { 
			continue; 
		}

		$URL = $rowFields[$idxFolder].replace("/", "" )

		if(!(Test-Path -Path $destinationDirectory/$URL ) -and !($URL.Equals("") )) {		
			if($destinationDirectory.Contains("\")){
				[System.IO.Directory]::CreateDirectory($destinationDirectory+"\"+$URL)
			}
			else{
				[System.IO.Directory]::CreateDirectory($destinationDirectory+"/"+$URL)
			}				
		}
		
		(New-Object System.Net.WebClient).DownloadFile($rowFields[$idxFileUri], "$destinationDirectory"+$rowFields[$idxFolder]+$rowFields[$idxFileName])
	}

	$runDuration = $stopWatch.Elapsed.TotalSeconds
	Write-Output "XTherPS downloaded the requiered logic in [$runDuration] seconds"
}

#
# Executes the compatibility logic for download the required resources
#
function XTherInstallCompatibleResources ($myInstallDir, $myResources, $currentPath)
{
	#Detect which resources wants to install
	if ($myResources.Equals("*")) {
		$myResources = "STD,CHR,FIR,EDG"
	}

	#Invoke SEResourcesInstaller script
	$installerCommand = "./SEResourcesInstaller.ps1 -myDriverOutput '$myInstallDir' -myResources '$myResources'"
	$ScriptBlock = [ScriptBlock]::Create($installerCommand)	
	Invoke-Command -ScriptBlock $ScriptBlock
}

#
# Prints corporate brand
#
function PrintCorporateBrand($myInstallDir, $myResources)
{
	$t = $host.ui.RawUI.ForegroundColor
	$host.ui.RawUI.ForegroundColor = "Green"
	Write-Output "#################################################################################################################"
	Write-Output "# GreenSQA XTherPS by TIA Team! is installing the resources [$myResources] in [$myInstallDir]                      "
	Write-Output "#################################################################################################################"
	$host.ui.RawUI.ForegroundColor = $t
}

#
# Executes XTher
#
function XTherRunAll ($myInstallDir, $myResources)
{
	$stopWatch = [system.diagnostics.stopwatch]::startNew()
	$currentPath = $pwd

	try {
		XTherDownloadLogicScripts
		XTherInstallCompatibleResources $myInstallDir $myResources $currentPath
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
		Write-Output "`nXTherPS executed in [$runDuration] seconds"
	}
}

# Main Entrypoint
PrintCorporateBrand $installDir $resources
XTherRunAll $installDir $resources
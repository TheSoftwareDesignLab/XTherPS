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
#  Install the selenium stand alone server and the webdrivers 
#  maintaining compatibility between: 
#      - Operative system (Windows, Linux, MacOS)
#      - Operative system architecture (x86, x64)
#      - Instaled browser version (Chrome, Firefox, Edge, IExplorer)
#     	
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#

param([String]$myResources='STD',
	  [String]$myDriverOutput='C:/GreenSQA/AiMaps/Selenium/'
	 )

#
# Worker block for downloading the resources (Stand alone or webdrivers)
#
$downloaderWorker = { param([String]$driverOutput, [String]$componentName, [String]$xTherLocation)

Write-Output "`nDownload Worker for [$componentName] Initialized"

# library
. $xTherLocation/SEResourcesDB.ps1

	#
	# Checks if a url begins with the "http" string
	#
	function IsValidURL([string]$resourceURL) 
	{	
		if ($resourceURL.Contains("http"))
		{
			return $true
		}
		else 
		{
			Write-Output "The URL is not valid [$resourceURL]"
			return  $false
		}
	}

	#
	# Gets the compatible URL for the specified resource
	#
	function GetCompatibleResourceDownloadURL ([string]$resName)
	{
		[string]$extractedURL = "NONE";

		try {
			$result = GetResourceDownloadURL $resName
			
			#Extracts the url which is in the format [["the url"]]
			$extractedURL = ([regex]"(\[\[.+])").Match($result).Captures[0].value
			$extractedURL = $extractedURL.Replace("[", "").Replace("]", "")		
		}
		catch {
			Write-Output "There were errors getting compatible URL for the resource [$resName]"
			Write-Output $_.Exception.Message
			Write-Output $_.Exception.ItemName
		}

		return $extractedURL
	}

    #
	# Downloads a file
	#
	function DownloadPackageRaw ([String]$resourceUrl, [string]$packName) 
	{
		#Get the resource name
		$lastSegment = $resourceUrl.Split("/").Length - 1
		$resourceName = $resourceUrl.Split("/")[$lastSegment]

		#download the resource
		(New-Object System.Net.WebClient).DownloadFile("$resourceUrl", "$driverOutput/$resourceName")

		#Writes the results to the console
		Write-Output " the package [$packName] of the resource [$resourceName]`n is downloaded to [$driverOutput/$packName]"		
	}

    #
	# Download and unzip a resource, finally removes the zip file downloaded
	#
	function DownloadAndUnzip ([string]$resourceUrl, [string]$packAlias) {
		$packageName = ""
		[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
		
		if ($resourceUrl.Contains(".tar")) {
			$packageName = "$driverOutput/$packAlias" + "_pack.tar.gz"
			(New-Object System.Net.WebClient).DownloadFile("$resourceUrl", "$packageName")
			Start-Sleep -m 800
			Invoke-Expression "tar xf '$packageName' -C '$driverOutput/'"   
		}else {
			$packageName = "$driverOutput$packAlias" + "_pack.zip"
			(New-Object System.Net.WebClient).DownloadFile("$resourceUrl", "$packageName")
			Start-Sleep -m 800
			Expand-Archive -Path "$packageName" -DestinationPath "$driverOutput" -Force	
		}
		
		Start-Sleep -m 500
		Write-Output " the package [$packageName] of the resource [$resourceUrl]`n is downloaded and expanded to [$driverOutput]"
		Remove-Item $packageName
	}

	if ($componentName -eq "STD") {
		[string]$myStandAloneURL = GetCompatibleResourceDownloadURL("STD")
		$validationResult = IsValidURL($myStandAloneURL)

		if ($validationResult -eq $true){
			DownloadPackageRaw $myStandAloneURL $componentName
		}
    }

	if ($componentName -eq "CHR") {
		$myChromeDriverURL = GetCompatibleResourceDownloadURL("CHR")
		$validationResult = IsValidURL($myChromeDriverURL)

		if ($validationResult -eq $true){
			DownloadAndUnzip $myChromeDriverURL $componentName
		}
	}
    
	if ($componentName -eq "FIR") {
		$myGeckoDriverURL = GetCompatibleResourceDownloadURL("FIR")
		$validationResult = IsValidURL($myGeckoDriverURL)

		if ($validationResult  -eq $true) {
			DownloadAndUnzip $myGeckoDriverURL $componentName
		}
	}
	
	if ($componentName -eq "EDG") {
		$myEdgeDriverURL = GetCompatibleResourceDownloadURL ("EDG")
		$validationResult = IsValidURL($myEdgeDriverURL)
	
		if ($validationResult -eq  $true) {
			DownloadPackageRaw $myEdgeDriverURL $componentName
		}
	}

	Write-Output "Download Worker for [$componentName] Finished"
}

#
# Install the selenium webdrivers and the selenium stand alone
#
function installSeleniumSupportResources
{
	Write-Output "Installing the selenium support resources [$myResources] in [$myDriverOutput]"
	$xtherLocation = $pwd

	if(!(Test-Path -Path $myDriverOutput)) {		
		[System.IO.Directory]::CreateDirectory("$myDriverOutput")
		Write-Output "The output directory has been created at [$myDriverOutput]"
	}

	if ($myResources.Contains("STD"))
	{
		Start-Job -ScriptBlock $downloaderWorker -ArgumentList $myDriverOutput,"STD",$xtherLocation
	}

	if ($myResources.Contains("CHR"))
	{
		Start-Job -ScriptBlock $downloaderWorker -ArgumentList $myDriverOutput,"CHR",$xtherLocation	
	}

	if ($myResources.Contains("FIR"))
	{
		Start-Job -ScriptBlock $downloaderWorker -ArgumentList $myDriverOutput,"FIR",$xtherLocation		
	}

	if ($myResources.Contains("EDG"))
	{
		Start-Job -ScriptBlock $downloaderWorker -ArgumentList $myDriverOutput,"EDG",$xtherLocation		
	}

	# Wait for the downloaderWorkers to finish
	Get-Job | Wait-Job | Receive-Job
}

# Main Entrypoint
installSeleniumSupportResources
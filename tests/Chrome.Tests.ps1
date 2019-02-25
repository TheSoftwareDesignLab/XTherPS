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
# Testing the chrome webdriver
#
# @EiderMauricioAristizábalErazo
#

# Loads the code under test
$currentDirectory = [System.IO.Path]::GetDirectoryName($PSCommandPath)

. $currentDirectory/../src/SEResourcesDB.ps1
. $currentDirectory/../src/dal/DALChrome.ps1

# Tests logic
Describe -Name 'GetResourceDownloadURL' -Tags @('unitary') {

    $chromeDriverResource = "CHR"

    It 'should return chrome driver valid URL for browser 72' {
        #Arrange
        $expectedDriverUrlPart = "*2.46*"

        #act executing logic
        Mock 'GetResourceFullVersion' -MockWith { "72.0.3626.109" }
        $downloadURL = GetResourceDownloadURL -resourceName $chromeDriverResource -maskResponse $False

        #assert that the url points to the proper resource
        $downloadURL | Should -BeLike $expectedDriverUrlPart
    }

}

Describe -Name 'GetChromeVersionCrossPlatform' -Tags @('unitary') {

    $chromeDriverResource = "CHR"

    It 'should return chrome version for Windows' {
        #Arrange
        $expectedChromeVersion = "1.2.3.4"
        Mock 'GetOsName' -MockWith { "WIN" }
        Mock 'Get-ItemProperty' -MockWith { "this will be the version $expectedChromeVersion to be returned" } 

        #act executing logic
        $actualChromeVersion = GetChromeVersionCrossPlatform

        #assert that extracted version number was the expected
        $actualChromeVersion | Should -BeExactly $expectedChromeVersion
    }

    It 'should return chrome version for MacOS' {
        #Arrange
        $expectedChromeVersion = "1.2.3.4"
        Mock 'GetOsName' -MockWith { "MAC" }
        Mock 'Test-Path' -MockWith { $True }        
        Mock 'cat' -MockWith { "this will be the version $expectedChromeVersion to be returned" } 

        #act executing logic
        $actualChromeVersion = GetChromeVersionCrossPlatform

        #assert that extracted version number was the expected
        $actualChromeVersion | Should -BeExactly $expectedChromeVersion
    }

    It 'should return chrome version for Linux' {
        #Arrange
        $expectedChromeVersion = "1.2.3.4"
        Mock 'GetOsName' -MockWith { "LNX" }
        Mock 'Invoke-Expression' -MockWith { '/google/chrome'} -ParameterFilter { $command -eq "which google-chrome"} 
        Mock 'Invoke-Expression' -MockWith { $expectedChromeVersion} -ParameterFilter { $command -like "*version"}

        #act executing logic
        $actualChromeVersion = GetChromeVersionCrossPlatform

        #assert that extracted version number was the expected
        $actualChromeVersion | Should -BeExactly $expectedChromeVersion
    }
}

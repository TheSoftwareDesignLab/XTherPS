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
# Testing the firefox webdriver
#
# @EiderMauricioAristizábalErazo
#

# Loads the code under test
$currentDirectory = [System.IO.Path]::GetDirectoryName($PSCommandPath)
. $currentDirectory/../src/SEResourcesDB.ps1

# Tests logic
Describe 'GetResourceDownloadURL' {

    $firefoxDriverResource = "FIR"

    It 'should return firefox driver valid URL for browser 64' {
        #Arrange
        $expectedDriverUrlPart = "*0.24*"

        #act executing logic
        Mock 'GetResourceFullVersion' -MockWith { "64.0.2" }
        $downloadURL = GetResourceDownloadURL -resourceName $firefoxDriverResource -maskResponse $False

        #assert that the url points to the proper resource
        $downloadURL | Should -BeLike $expectedDriverUrlPart
    }
}

Describe -Name 'GetFireFoxVersionCrossPlatform' -Tags @('unitary') {

    It 'should return FireFox version for Windows' {
        #Arrange
        $expectedFireFoxVersion = "1.2.3"
        Mock 'GetOsName' -MockWith { "WIN" }
        Mock 'Test-Path' -MockWith { $True }
        Mock 'Get-ItemProperty' -MockWith { "this will be the version $expectedFireFoxVersion to be returned" } 

        #act executing logic
        $actualFireFoxVersion = GetFireFoxVersionCrossPlatform

        #assert that extracted version number was the expected
        $actualFireFoxVersion | Should -BeExactly $expectedFireFoxVersion
    }

    It 'should return FireFox version for MacOS' {
        #Arrange
        $expectedFireFoxVersion = "1.2"
        Mock 'GetOsName' -MockWith { "MAC" }
        Mock 'Test-Path' -MockWith { $True }        
        Mock 'cat' -MockWith { "this will be the version=$expectedFireFoxVersion to be returned" } 

        #act executing logic
        $actualFireFoxVersion = GetFireFoxVersionCrossPlatform

        #assert that extracted version number was the expected
        $actualFireFoxVersion | Should -BeExactly $expectedFireFoxVersion
    }

    It 'should return FireFox version for Linux' {
        #Arrange
        $expectedFireFoxVersion = "1.2"
        Mock 'GetOsName' -MockWith { "LNX" }
        Mock 'Invoke-Expression' -MockWith { '/mozilla/firefox'} -ParameterFilter { $command -eq "which firefox"} 
        Mock 'Invoke-Expression' -MockWith { $expectedFireFoxVersion} -ParameterFilter { $command -like "*version"}

        #act executing logic
        $actualFireFoxVersion = GetFireFoxVersionCrossPlatform

        #assert that extracted version number was the expected
        $actualFireFoxVersion | Should -BeExactly $expectedFireFoxVersion
    }
}

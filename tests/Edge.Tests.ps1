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
# Testing the edge webdriver
#
# @EiderMauricioAristizábalErazo
#

# Loads the code under test and some other test resources
$currentDirectory = [System.IO.Path]::GetDirectoryName($PSCommandPath)
. $currentDirectory/../src/SEResourcesDB.ps1
. $currentDirectory/../src/dal/DALEdge.ps1
. $currentDirectory/AssertUtils.ps1

# Tests logic
Describe 'GetResourceDownloadURL' {

    $edgeDriverResource = "EDG"

    It 'should return edge driver valid URL for browser 12' {
        #Arrange
        $expectedDriverUrlPart = "8D0D08CF-790D-4586-B726-C6469A9ED49C"

        #act executing logic
        Mock 'GetResourceFullVersion' -MockWith { "12" }
        $downloadURL = GetResourceDownloadURL -resourceName $edgeDriverResource -maskResponse $False

        #assert that the url points to the proper resource
        AssertStringContainsValue $downloadURL $expectedDriverUrlPart "Expected to contain a URL"
    }

}

Describe -Name 'GetEdgeVersionCrossPlatform' -Tags @('unitary') {

    It 'should return edge version for Windows' {
        #Arrange
        $expectedEdgeVersion = "17.17134.556"
        Mock 'FindEdgeApplicationPath' -MockWith { "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe" }
        Mock 'Test-Path' -MockWith { $True }
        Mock 'Get-ItemProperty' -MockWith { "this will be the version 11.00.17134.556 to be returned" } 

        #act executing logic
        $actualEdgeVersion = GetEdgeVersionCrossPlatform

        #assert that extracted version number was the expected
        AssertStringsAreEqual $actualEdgeVersion $expectedEdgeVersion "Expected to be version $expectedEdgeVersion"
    }
}
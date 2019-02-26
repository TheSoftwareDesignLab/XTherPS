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
# Testing the stand-alone webdriver
#
# @EiderMauricioAristizábalErazo
#

# Loads the code under test and some other test resources
$currentDirectory = [System.IO.Path]::GetDirectoryName($PSCommandPath)
. $currentDirectory/../src/SEResourcesDB.ps1
. $currentDirectory/AssertUtils.ps1

# Tests logic
Describe -Name 'GetResourceDownloadURL' -Tags @('unitary') {

    $STDResource = "STD"

    It 'should return stand-alone driver valid URL for java 1.8 ' {     
        #arrange
        $expectedStandAloneUrlPart = "3.141"

        #act executing logic
        Mock 'GetInstalledJavaVersion' -MockWith { "1.8" }
        $downloadURL = GetResourceDownloadURL -resourceName $STDResource -maskResponse $False

        #assert that the url is valid and points to the proper resource
        AssertThisUrlExists $downloadURL "The URL [$downloadURL] does not exists"        
        AssertStringContainsValue $downloadURL $expectedStandAloneUrlPart "Expected to contain a URL"
    }
}
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
# Utils for performing assertions
#
# @EiderMauricioAristizábalErazo
#

#
# Asserts if an url exists
#
function AssertThisUrlExists([string] $urlToTest, [string]$errorMessage)
{
    #make the request
    $HTTP_Request = [System.Net.WebRequest]::Create($urlToTest)
    $HTTP_Response = $HTTP_Request.GetResponse()
    [int]$statusCode = [int]$HTTP_Response.StatusCode
    $HTTP_Response.Close()
 
    #evaluate the request answer
    If ($statusCode -ne 200) {
        throw $errorMessage
    }
}

#
# Alternative to assertion: Should -Not -BeNullOrEmpty
#
function AssertStringIsNotNullOrEmpty ([string] $actualValue, [string] $errorMessage)
{
    if ([string]::IsNullOrEmpty($actualValue))
    {
        throw $errorMessage
    }
}

#
# Alternative to assertion: Should -BeLike *string*
#
function AssertStringContainsValue ([string] $inputString, [string] $containsString, [string] $errorMessage)
{
    if ($inputString.ToUpper().Contains($containsString) -eq $false)
    {
        throw $errorMessage
    }
}

#
# Alternative to assertion: Should -BeExactly
#
function AssertStringsAreEqual ([string] $expectedString, [string] $actualString, [string] $errorMessage)
{
    if ($expectedString -ne $actualString)
    {
        throw $errorMessage
    }
}
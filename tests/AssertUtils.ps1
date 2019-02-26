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
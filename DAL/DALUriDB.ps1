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
# Database of the URLS for the supported resources (Stand alone and webdrivers)
#
# @EiderMauricioAristizábalErazo
# @DilanStevenMejiaBuitrago
#

$idxDrvrName = 0
$idxOSName   = 1
$idxOSArch   = 2
$idxFormatPk = 3
$idxBrowsVer = 4
$idxJavaVer  = 4
$idxDrivrURL = 5
$OperativeSName = GetOsName

$drvrDB = @"
//Selenium Stand Alone
STD;ALL;--;JAR;1.7-LST;https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar

//Chrome windows
CHR;WIN;86;ZIP;071-073;https://chromedriver.storage.googleapis.com/2.46/chromedriver_win32.zip
CHR;WIN;86;ZIP;070-072;https://chromedriver.storage.googleapis.com/2.45/chromedriver_win32.zip
CHR;WIN;86;ZIP;069-071;https://chromedriver.storage.googleapis.com/2.44/chromedriver_win32.zip
CHR;WIN;86;ZIP;068-070;https://chromedriver.storage.googleapis.com/2.42/chromedriver_win32.zip
CHR;WIN;86;ZIP;067-069;https://chromedriver.storage.googleapis.com/2.41/chromedriver_win32.zip
CHR;WIN;86;ZIP;066-068;https://chromedriver.storage.googleapis.com/2.40/chromedriver_win32.zip
//Chrome mac
CHR;MAC;64;ZIP;071-073;https://chromedriver.storage.googleapis.com/2.46/chromedriver_mac64.zip
CHR;MAC;64;ZIP;070-072;https://chromedriver.storage.googleapis.com/2.45/chromedriver_mac64.zip
CHR;MAC;64;ZIP;069-071;https://chromedriver.storage.googleapis.com/2.44/chromedriver_mac64.zip
CHR;MAC;64;ZIP;068-070;https://chromedriver.storage.googleapis.com/2.42/chromedriver_mac64.zip
CHR;MAC;64;ZIP;067-069;https://chromedriver.storage.googleapis.com/2.41/chromedriver_mac64.zip
CHR;MAC;64;ZIP;066-068;https://chromedriver.storage.googleapis.com/2.40/chromedriver_mac64.zip
//Chrome linux 64
CHR;LNX;64;ZIP;071-073;https://chromedriver.storage.googleapis.com/2.46/chromedriver_linux64.zip
CHR;LNX;64;ZIP;070-072;https://chromedriver.storage.googleapis.com/2.45/chromedriver_linux64.zip
CHR;LNX;64;ZIP;069-071;https://chromedriver.storage.googleapis.com/2.44/chromedriver_linux64.zip
CHR;LNX;64;ZIP;068-070;https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip
CHR;LNX;64;ZIP;067-069;https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
CHR;LNX;64;ZIP;066-068;https://chromedriver.storage.googleapis.com/2.40/chromedriver_linux64.zip
//Chrome linux 86
CHR;LNX;86;ZIP;071-073;https://chromedriver.storage.googleapis.com/2.46/chromedriver_linux32.zip
CHR;LNX;86;ZIP;070-072;https://chromedriver.storage.googleapis.com/2.45/chromedriver_linux32.zip
CHR;LNX;86;ZIP;069-071;https://chromedriver.storage.googleapis.com/2.44/chromedriver_linux32.zip
CHR;LNX;86;ZIP;068-070;https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux32.zip
CHR;LNX;86;ZIP;067-069;https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux32.zip
CHR;LNX;86;ZIP;066-068;https://chromedriver.storage.googleapis.com/2.40/chromedriver_linux32.zip
//FireFox linux 86
FIR;LNX;86;TGZ;057-999;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux32.tar.gz
FIR;LNX;86;TGZ;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux32.tar.gz
FIR;LNX;86;TGZ;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux32.tar.gz
//FireFox linux 64
FIR;LNX;64;TGZ;057-999;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
FIR;LNX;64;TGZ;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz
FIR;LNX;64;TGZ;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux64.tar.gz
//FireFox windows 86
FIR;WIN;86;ZIP;057-999;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-win32.zip
FIR;WIN;86;ZIP;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win32.zip
FIR;WIN;86;ZIP;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-win32.zip
//FireFox windows 64
FIR;WIN;64;ZIP;057-999;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-win64.zip
FIR;WIN;64;ZIP;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win64.zip
FIR;WIN;64;ZIP;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-win64.zip
//FireFox mac 64
FIR;MAC;64;TGZ;057-999;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-macos.tar.gz
FIR;MAC;64;TGZ;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-macos.tar.gz
FIR;MAC;64;TGZ;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-macos.tar.gz
//Edge Windows 64
EDG;WIN;64;;17-99;https://download.microsoft.com/download/F/8/A/F8AF50AB-3C3A-4BC4-8773-DC27B32988DD/MicrosoftWebDriver.exe
EDG;WIN;64;;16-17;https://download.microsoft.com/download/D/4/1/D417998A-58EE-4EFE-A7CC-39EF9E020768/MicrosoftWebDriver.exe
EDG;WIN;64;;15-16;https://download.microsoft.com/download/3/4/2/342316D7-EBE0-4F10-ABA2-AE8E0CDF36DD/MicrosoftWebDriver.exe
EDG;WIN;64;;14-15;https://download.microsoft.com/download/3/2/D/32D3E464-F2EF-490F-841B-05D53C848D15/MicrosoftWebDriver.exe
EDG;WIN;64;;13-14;https://download.microsoft.com/download/C/0/7/C07EBF21-5305-4EC8-83B1-A6FCC8F93F45/MicrosoftWebDriver.exe
EDG;WIN;64;;12-13;https://download.microsoft.com/download/8/D/0/8D0D08CF-790D-4586-B726-C6469A9ED49C/MicrosoftWebDriver.exe
//Edge Windows 32
EDG;WIN;32;;17-99;https://download.microsoft.com/download/F/8/A/F8AF50AB-3C3A-4BC4-8773-DC27B32988DD/MicrosoftWebDriver.exe
EDG;WIN;32;;16-17;https://download.microsoft.com/download/D/4/1/D417998A-58EE-4EFE-A7CC-39EF9E020768/MicrosoftWebDriver.exe
EDG;WIN;32;;15-16;https://download.microsoft.com/download/3/4/2/342316D7-EBE0-4F10-ABA2-AE8E0CDF36DD/MicrosoftWebDriver.exe
EDG;WIN;32;;14-15;https://download.microsoft.com/download/3/2/D/32D3E464-F2EF-490F-841B-05D53C848D15/MicrosoftWebDriver.exe
EDG;WIN;32;;13-14;https://download.microsoft.com/download/C/0/7/C07EBF21-5305-4EC8-83B1-A6FCC8F93F45/MicrosoftWebDriver.exe
EDG;WIN;32;;12-13;https://download.microsoft.com/download/8/D/0/8D0D08CF-790D-4586-B726-C6469A9ED49C/MicrosoftWebDriver.exe
"@
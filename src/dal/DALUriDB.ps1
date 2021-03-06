﻿#
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
//
//
//Chrome windows 32
CHR;WIN;86;ZIP;092-999;https://chromedriver.storage.googleapis.com/92.0.4515.43/chromedriver_win32.zip
CHR;WIN;86;ZIP;091-091;https://chromedriver.storage.googleapis.com/91.0.4472.101/chromedriver_win32.zip
CHR;WIN;86;ZIP;090-090;https://chromedriver.storage.googleapis.com/90.0.4430.24/chromedriver_win32.zip
CHR;WIN;86;ZIP;089-089;https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_win32.zip
CHR;WIN;86;ZIP;088-088;https://chromedriver.storage.googleapis.com/88.0.4324.96/chromedriver_win32.zip
CHR;WIN;86;ZIP;087-087;https://chromedriver.storage.googleapis.com/87.0.4280.20/chromedriver_win32.zip
CHR;WIN;86;ZIP;086-086;https://chromedriver.storage.googleapis.com/86.0.4240.22/chromedriver_win32.zip
CHR;WIN;86;ZIP;085-085;https://chromedriver.storage.googleapis.com/85.0.4183.87/chromedriver_win32.zip
CHR;WIN;86;ZIP;084-084;https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_win32.zip
CHR;WIN;86;ZIP;083-083;https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_win32.zip
CHR;WIN;86;ZIP;081-081;https://chromedriver.storage.googleapis.com/81.0.4044.69/chromedriver_win32.zip
CHR;WIN;86;ZIP;080-080;https://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_win32.zip
CHR;WIN;86;ZIP;079-079;https://chromedriver.storage.googleapis.com/79.0.3945.16/chromedriver_win32.zip
CHR;WIN;86;ZIP;078-078;https://chromedriver.storage.googleapis.com/78.0.3904.70/chromedriver_win32.zip
CHR;WIN;86;ZIP;077-077;https://chromedriver.storage.googleapis.com/77.0.3865.40/chromedriver_win32.zip
CHR;WIN;86;ZIP;076-076;https://chromedriver.storage.googleapis.com/76.0.3809.126/chromedriver_win32.zip
CHR;WIN;86;ZIP;075-075;https://chromedriver.storage.googleapis.com/75.0.3770.8/chromedriver_win32.zip
CHR;WIN;86;ZIP;074-074;https://chromedriver.storage.googleapis.com/74.0.3729.6/chromedriver_win32.zip
CHR;WIN;86;ZIP;073-073;https://chromedriver.storage.googleapis.com/73.0.3683.68/chromedriver_win32.zip
CHR;WIN;86;ZIP;071-072;https://chromedriver.storage.googleapis.com/2.46/chromedriver_win32.zip
CHR;WIN;86;ZIP;070-072;https://chromedriver.storage.googleapis.com/2.45/chromedriver_win32.zip
CHR;WIN;86;ZIP;069-071;https://chromedriver.storage.googleapis.com/2.44/chromedriver_win32.zip
CHR;WIN;86;ZIP;068-070;https://chromedriver.storage.googleapis.com/2.42/chromedriver_win32.zip
CHR;WIN;86;ZIP;067-069;https://chromedriver.storage.googleapis.com/2.41/chromedriver_win32.zip
CHR;WIN;86;ZIP;066-068;https://chromedriver.storage.googleapis.com/2.40/chromedriver_win32.zip
//Chrome mac
CHR;MAC;64;ZIP;092-999;https://chromedriver.storage.googleapis.com/92.0.4515.43/chromedriver_mac64.zip
CHR;MAC;64;ZIP;091-091;https://chromedriver.storage.googleapis.com/91.0.4472.101/chromedriver_mac64.zip
CHR;MAC;64;ZIP;090-090;https://chromedriver.storage.googleapis.com/90.0.4430.24/chromedriver_mac64.zip
CHR;MAC;64;ZIP;089-089;https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_mac64.zip
CHR;MAC;64;ZIP;088-088;https://chromedriver.storage.googleapis.com/88.0.4324.96/chromedriver_mac64.zip
CHR;MAC;64;ZIP;087-087;https://chromedriver.storage.googleapis.com/87.0.4280.20/chromedriver_mac64.zip
CHR;MAC;64;ZIP;086-086;https://chromedriver.storage.googleapis.com/86.0.4240.22/chromedriver_mac64.zip
CHR;MAC;64;ZIP;085-085;https://chromedriver.storage.googleapis.com/85.0.4183.87/chromedriver_mac64.zip
CHR;MAC;64;ZIP;084-084;https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_mac64.zip
CHR;MAC;64;ZIP;083-083;https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_mac64.zip
CHR;MAC;64;ZIP;081-081;https://chromedriver.storage.googleapis.com/81.0.4044.69/chromedriver_mac64.zip
CHR;MAC;64;ZIP;080-080;https://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_mac64.zip
CHR;MAC;64;ZIP;079-079;https://chromedriver.storage.googleapis.com/79.0.3945.16/chromedriver_mac64.zip
CHR;MAC;64;ZIP;078-078;https://chromedriver.storage.googleapis.com/78.0.3904.70/chromedriver_mac64.zip
CHR;MAC;64;ZIP;077-077;https://chromedriver.storage.googleapis.com/77.0.3865.40/chromedriver_mac64.zip
CHR;MAC;64;ZIP;076-076;https://chromedriver.storage.googleapis.com/76.0.3809.126/chromedriver_mac64.zip
CHR;MAC;64;ZIP;075-075;https://chromedriver.storage.googleapis.com/75.0.3770.8/chromedriver_mac64.zip
CHR;MAC;64;ZIP;074-074;https://chromedriver.storage.googleapis.com/74.0.3729.6/chromedriver_mac64.zip
CHR;MAC;64;ZIP;073-073;https://chromedriver.storage.googleapis.com/73.0.3683.68/chromedriver_mac64.zip
CHR;MAC;64;ZIP;071-072;https://chromedriver.storage.googleapis.com/2.46/chromedriver_mac64.zip
CHR;MAC;64;ZIP;070-072;https://chromedriver.storage.googleapis.com/2.45/chromedriver_mac64.zip
CHR;MAC;64;ZIP;069-071;https://chromedriver.storage.googleapis.com/2.44/chromedriver_mac64.zip
CHR;MAC;64;ZIP;068-070;https://chromedriver.storage.googleapis.com/2.42/chromedriver_mac64.zip
CHR;MAC;64;ZIP;067-069;https://chromedriver.storage.googleapis.com/2.41/chromedriver_mac64.zip
CHR;MAC;64;ZIP;066-068;https://chromedriver.storage.googleapis.com/2.40/chromedriver_mac64.zip
//Chrome linux 64
CHR;LNX;64;ZIP;092-999;https://chromedriver.storage.googleapis.com/92.0.4515.43/chromedriver_linux64.zip
CHR;LNX;64;ZIP;091-091;https://chromedriver.storage.googleapis.com/91.0.4472.101/chromedriver_linux64.zip
CHR;LNX;64;ZIP;090-090;https://chromedriver.storage.googleapis.com/90.0.4430.24/chromedriver_linux64.zip
CHR;LNX;64;ZIP;089-089;https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_linux64.zip
CHR;LNX;64;ZIP;088-088;https://chromedriver.storage.googleapis.com/88.0.4324.96/chromedriver_linux64.zip
CHR;LNX;64;ZIP;087-087;https://chromedriver.storage.googleapis.com/87.0.4280.20/chromedriver_linux64.zip
CHR;LNX;64;ZIP;086-086;https://chromedriver.storage.googleapis.com/86.0.4240.22/chromedriver_linux64.zip
CHR;LNX;64;ZIP;085-085;https://chromedriver.storage.googleapis.com/85.0.4183.87/chromedriver_linux64.zip
CHR;LNX;64;ZIP;084-084;https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_linux64.zip
CHR;LNX;64;ZIP;083-083;https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip
CHR;LNX;64;ZIP;081-081;https://chromedriver.storage.googleapis.com/81.0.4044.69/chromedriver_linux64.zip
CHR;LNX;64;ZIP;080-080;https://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_linux64.zip
CHR;LNX;64;ZIP;079-079;https://chromedriver.storage.googleapis.com/79.0.3945.16/chromedriver_linux64.zip
CHR;LNX;64;ZIP;078-078;https://chromedriver.storage.googleapis.com/78.0.3904.70/chromedriver_linux64.zip
CHR;LNX;64;ZIP;077-077;https://chromedriver.storage.googleapis.com/77.0.3865.40/chromedriver_linux64.zip
CHR;LNX;64;ZIP;076-076;https://chromedriver.storage.googleapis.com/76.0.3809.126/chromedriver_linux64.zip
CHR;LNX;64;ZIP;075-075;https://chromedriver.storage.googleapis.com/75.0.3770.8/chromedriver_linux64.zip
CHR;LNX;64;ZIP;074-074;https://chromedriver.storage.googleapis.com/74.0.3729.6/chromedriver_linux64.zip
CHR;LNX;64;ZIP;073-073;https://chromedriver.storage.googleapis.com/73.0.3683.68/chromedriver_linux64.zip
CHR;LNX;64;ZIP;071-072;https://chromedriver.storage.googleapis.com/2.46/chromedriver_linux64.zip
CHR;LNX;64;ZIP;070-072;https://chromedriver.storage.googleapis.com/2.45/chromedriver_linux64.zip
CHR;LNX;64;ZIP;069-071;https://chromedriver.storage.googleapis.com/2.44/chromedriver_linux64.zip
CHR;LNX;64;ZIP;068-070;https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip
CHR;LNX;64;ZIP;067-069;https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
CHR;LNX;64;ZIP;066-068;https://chromedriver.storage.googleapis.com/2.40/chromedriver_linux64.zip
//Chrome linux 86
CHR;LNX;86;ZIP;076-999;NON SUPPORTED
CHR;LNX;86;ZIP;075-075;https://chromedriver.storage.googleapis.com/75.0.3770.8/chromedriver_linux32.zip
CHR;LNX;86;ZIP;074-074;https://chromedriver.storage.googleapis.com/74.0.3729.6/chromedriver_linux32.zip
CHR;LNX;8x6;ZIP;073-073;https://chromedriver.storage.googleapis.com/73.0.3683.68/chromedriver_linux32.zip
CHR;LNX;86;ZIP;071-072;https://chromedriver.storage.googleapis.com/2.46/chromedriver_linux32.zip
CHR;LNX;86;ZIP;070-072;https://chromedriver.storage.googleapis.com/2.45/chromedriver_linux32.zip
CHR;LNX;86;ZIP;069-071;https://chromedriver.storage.googleapis.com/2.44/chromedriver_linux32.zip
CHR;LNX;86;ZIP;068-070;https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux32.zip
CHR;LNX;86;ZIP;067-069;https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux32.zip
CHR;LNX;86;ZIP;066-068;https://chromedriver.storage.googleapis.com/2.40/chromedriver_linux32.zip
//
//
//FireFox linux 86
FIR;LNX;86;TGZ;084-999;https://github.com/mozilla/geckodriver/releases/download/v0.29.0/geckodriver-v0.29.0-linux32.tar.gz
FIR;LNX;86;TGZ;082-083;https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-linux32.tar.gz
FIR;LNX;86;TGZ;079-081;https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-linux32.tar.gz
FIR;LNX;86;TGZ;069-078;https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux32.tar.gz
FIR;LNX;86;TGZ;068-068;https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-linux32.tar.gz
FIR;LNX;86;TGZ;057-067;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux32.tar.gz
FIR;LNX;86;TGZ;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux32.tar.gz
FIR;LNX;86;TGZ;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux32.tar.gz
//FireFox linux 64
FIR;LNX;64;TGZ;084-999;https://github.com/mozilla/geckodriver/releases/download/v0.29.0/geckodriver-v0.29.0-linux64.tar.gz
FIR;LNX;64;TGZ;082-083;https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-linux64.tar.gz
FIR;LNX;64;TGZ;079-081;https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-linux64.tar.gz
FIR;LNX;64;TGZ;069-078;https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
FIR;LNX;64;TGZ;068-068;https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-linux64.tar.gz
FIR;LNX;64;TGZ;057-067;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
FIR;LNX;64;TGZ;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz
FIR;LNX;64;TGZ;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux64.tar.gz
//FireFox windows 86
FIR;WIN;86;ZIP;084-999;https://github.com/mozilla/geckodriver/releases/download/v0.29.0/geckodriver-v0.29.0-win32.zip
FIR;WIN;86;ZIP;082-083;https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-win32.zip
FIR;WIN;86;ZIP;079-081;https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-win32.zip
FIR;WIN;86;ZIP;069-078;https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-win32.zip
FIR;WIN;86;ZIP;068-068;https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-win32.zip
FIR;WIN;86;ZIP;057-067;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-win32.zip
FIR;WIN;86;ZIP;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win32.zip
FIR;WIN;86;ZIP;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-win32.zip
//FireFox windows 64
FIR;WIN;64;ZIP;084-999;https://github.com/mozilla/geckodriver/releases/download/v0.29.0/geckodriver-v0.29.0-win64.zip
FIR;WIN;64;ZIP;082-083;https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-win64.zip
FIR;WIN;64;ZIP;079-081;https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-win64.zip
FIR;WIN;64;ZIP;069-078;https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-win64.zip
FIR;WIN;64;ZIP;068-068;https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-win64.zip
FIR;WIN;64;ZIP;057-067;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-win64.zip
FIR;WIN;64;ZIP;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win64.zip
FIR;WIN;64;ZIP;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-win64.zip
//FireFox mac 64
FIR;MAC;64;TGZ;084-999;https://github.com/mozilla/geckodriver/releases/download/v0.29.0/geckodriver-v0.29.0-macos.tar.gz
FIR;MAC;64;TGZ;082-083;https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-macos.tar.gz
FIR;MAC;64;TGZ;079-081;https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-macos.tar.gz
FIR;MAC;64;TGZ;069-078;https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-macos.tar.gz
FIR;MAC;64;TGZ;068-068;https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-macos.tar.gz
FIR;MAC;64;TGZ;057-067;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-macos.tar.gz
FIR;MAC;64;TGZ;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-macos.tar.gz
FIR;MAC;64;TGZ;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-macos.tar.gz
//
//
//Edge Legacy Windows 64
EDG;WIN;64;EXE;080-080;https://msedgedriver.azureedge.net/80.0.328.0/edgedriver_win64.zip
EDG;WIN;64;EXE;079-079;https://msedgedriver.azureedge.net/79.0.313.0/edgedriver_win64.zip
EDG;WIN;64;EXE;078-078;https://msedgedriver.azureedge.net/78.0.257.0/edgedriver_win64.zip
EDG;WIN;64;EXE;077-077;https://msedgedriver.azureedge.net/77.0.237.0/edgedriver_win64.zip
EDG;WIN;64;EXE;076-076;https://msedgedriver.azureedge.net/76.0.183.0/edgedriver_win64.zip
EDG;WIN;64;EXE;075-075;https://az813057.vo.msecnd.net/webdriver/msedgedriver_x64/msedgedriver.exe
EDG;WIN;64;EXE;017-017;https://download.microsoft.com/download/F/8/A/F8AF50AB-3C3A-4BC4-8773-DC27B32988DD/MicrosoftWebDriver.exe
EDG;WIN;64;EXE;016-016;https://download.microsoft.com/download/D/4/1/D417998A-58EE-4EFE-A7CC-39EF9E020768/MicrosoftWebDriver.exe
EDG;WIN;64;EXE;015-015;https://download.microsoft.com/download/3/4/2/342316D7-EBE0-4F10-ABA2-AE8E0CDF36DD/MicrosoftWebDriver.exe
EDG;WIN;64;EXE;014-014;https://download.microsoft.com/download/3/2/D/32D3E464-F2EF-490F-841B-05D53C848D15/MicrosoftWebDriver.exe
EDG;WIN;64;EXE;013-013;https://download.microsoft.com/download/C/0/7/C07EBF21-5305-4EC8-83B1-A6FCC8F93F45/MicrosoftWebDriver.exe
EDG;WIN;64;EXE;012-012;https://download.microsoft.com/download/8/D/0/8D0D08CF-790D-4586-B726-C6469A9ED49C/MicrosoftWebDriver.exe
//Edge Legacy Windows 32
EDG;WIN;32;EXE;080-080;https://msedgedriver.azureedge.net/80.0.328.0/edgedriver_win32.zip
EDG;WIN;32;EXE;079-079;https://msedgedriver.azureedge.net/79.0.313.0/edgedriver_win32.zip
EDG;WIN;32;EXE;078-078;https://msedgedriver.azureedge.net/78.0.257.0/edgedriver_win32.zip
EDG;WIN;32;EXE;077-077;https://msedgedriver.azureedge.net/77.0.237.0/edgedriver_win32.zip
EDG;WIN;32;EXE;076-076;https://msedgedriver.azureedge.net/76.0.183.0/edgedriver_win32.zip
EDG;WIN;32;EXE;075-075;https://az813057.vo.msecnd.net/webdriver/msedgedriver_x86/msedgedriver.exe
EDG;WIN;32;EXE;017-017;https://download.microsoft.com/download/F/8/A/F8AF50AB-3C3A-4BC4-8773-DC27B32988DD/MicrosoftWebDriver.exe
EDG;WIN;32;EXE;016-016;https://download.microsoft.com/download/D/4/1/D417998A-58EE-4EFE-A7CC-39EF9E020768/MicrosoftWebDriver.exe
EDG;WIN;32;EXE;015-015;https://download.microsoft.com/download/3/4/2/342316D7-EBE0-4F10-ABA2-AE8E0CDF36DD/MicrosoftWebDriver.exe
EDG;WIN;32;EXE;014-014;https://download.microsoft.com/download/3/2/D/32D3E464-F2EF-490F-841B-05D53C848D15/MicrosoftWebDriver.exe
EDG;WIN;32;EXE;013-013;https://download.microsoft.com/download/C/0/7/C07EBF21-5305-4EC8-83B1-A6FCC8F93F45/MicrosoftWebDriver.exe
EDG;WIN;32;EXE;012-012;https://download.microsoft.com/download/8/D/0/8D0D08CF-790D-4586-B726-C6469A9ED49C/MicrosoftWebDriver.exe
"@

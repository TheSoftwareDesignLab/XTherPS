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
//
//
//Chrome windows 32
CHR;WIN;86;ZIP;139-999;https://storage.googleapis.com/chrome-for-testing-public/139.0.7258.154/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;138-138;https://storage.googleapis.com/chrome-for-testing-public/138.0.7204.94/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;137-137;https://storage.googleapis.com/chrome-for-testing-public/137.0.7151.70/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;136-136;https://storage.googleapis.com/chrome-for-testing-public/136.0.7103.92/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;135-135;https://storage.googleapis.com/chrome-for-testing-public/135.0.7049.95/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;134-134;https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.88/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;133-133;https://storage.googleapis.com/chrome-for-testing-public/133.0.6943.141/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;132-132;https://storage.googleapis.com/chrome-for-testing-public/132.0.6834.159/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;131-131;https://storage.googleapis.com/chrome-for-testing-public/131.0.6778.264/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;130-130;https://storage.googleapis.com/chrome-for-testing-public/130.0.6723.69/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;129-129;https://storage.googleapis.com/chrome-for-testing-public/129.0.6668.58/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;128-128;https://storage.googleapis.com/chrome-for-testing-public/128.0.6613.119/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;127-127;https://storage.googleapis.com/chrome-for-testing-public/127.0.6533.72/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;126-126;https://storage.googleapis.com/chrome-for-testing-public/126.0.6478.126/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;125-125;https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.76/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;124-124;https://storage.googleapis.com/chrome-for-testing-public/124.0.6367.91/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;123-123;https://storage.googleapis.com/chrome-for-testing-public/123.0.6312.58/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;122-122;https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.57/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;121-121;https://storage.googleapis.com/chrome-for-testing-public/121.0.6167.184/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;120-120;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/120.0.6099.109/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;119-119;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/119.0.6045.105/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;118-118;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/118.0.5993.70/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;117-117;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/117.0.5938.88/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;116-116;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/116.0.5845.96/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;115-115;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/115.0.5790.170/win32/chromedriver-win32.zip
CHR;WIN;86;ZIP;114-114;https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_win32.zip
CHR;WIN;86;ZIP;113-113;https://chromedriver.storage.googleapis.com/113.0.5672.24/chromedriver_win32.zip
CHR;WIN;86;ZIP;112-112;https://chromedriver.storage.googleapis.com/112.0.5615.49/chromedriver_win32.zip
CHR;WIN;86;ZIP;111-111;https://chromedriver.storage.googleapis.com/111.0.5563.41/chromedriver_win32.zip
CHR;WIN;86;ZIP;110-110;https://chromedriver.storage.googleapis.com/110.0.5481.30/chromedriver_win32.zip
CHR;WIN;86;ZIP;109-109;https://chromedriver.storage.googleapis.com/109.0.5414.74/chromedriver_win32.zip
CHR;WIN;86;ZIP;108-108;https://chromedriver.storage.googleapis.com/108.0.5359.71/chromedriver_win32.zip
CHR;WIN;86;ZIP;107-107;https://chromedriver.storage.googleapis.com/107.0.5304.62/chromedriver_win32.zip
CHR;WIN;86;ZIP;106-106;https://chromedriver.storage.googleapis.com/106.0.5249.61/chromedriver_win32.zip
CHR;WIN;86;ZIP;105-105;https://chromedriver.storage.googleapis.com/105.0.5195.52/chromedriver_win32.zip
CHR;WIN;86;ZIP;104-104;https://chromedriver.storage.googleapis.com/104.0.5112.79/chromedriver_win32.zip
CHR;WIN;86;ZIP;103-103;https://chromedriver.storage.googleapis.com/103.0.5060.134/chromedriver_win32.zip
CHR;WIN;86;ZIP;102-102;https://chromedriver.storage.googleapis.com/102.0.5005.61/chromedriver_win32.zip
CHR;WIN;86;ZIP;101-101;https://chromedriver.storage.googleapis.com/101.0.4951.41/chromedriver_win32.zip
CHR;WIN;86;ZIP;100-100;https://chromedriver.storage.googleapis.com/100.0.4896.20/chromedriver_win32.zip
CHR;WIN;86;ZIP;099-099;https://chromedriver.storage.googleapis.com/99.0.4844.51/chromedriver_win32.zip
CHR;WIN;86;ZIP;098-098;https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_win32.zip
CHR;WIN;86;ZIP;097-097;https://chromedriver.storage.googleapis.com/97.0.4692.36/chromedriver_win32.zip
CHR;WIN;86;ZIP;096-096;https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_win32.zip
CHR;WIN;86;ZIP;095-095;https://chromedriver.storage.googleapis.com/95.0.4638.69/chromedriver_win32.zip
CHR;WIN;86;ZIP;094-094;https://chromedriver.storage.googleapis.com/94.0.4606.41/chromedriver_win32.zip
CHR;WIN;86;ZIP;093-093;https://chromedriver.storage.googleapis.com/93.0.4577.15/chromedriver_win32.zip
CHR;WIN;86;ZIP;092-092;https://chromedriver.storage.googleapis.com/92.0.4515.107/chromedriver_win32.zip
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

CHR;MAC;86;ZIP;139-999;https://storage.googleapis.com/chrome-for-testing-public/139.0.7258.154/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;86;ZIP;138-138;https://storage.googleapis.com/chrome-for-testing-public/138.0.7204.94/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;86;ZIP;137-137;https://storage.googleapis.com/chrome-for-testing-public/137.0.7151.70/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;86;ZIP;136-136;https://storage.googleapis.com/chrome-for-testing-public/136.0.7103.92/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;86;ZIP;135-135;https://storage.googleapis.com/chrome-for-testing-public/135.0.7049.95/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;86;ZIP;134-134;https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.88/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;86;ZIP;133-133;https://storage.googleapis.com/chrome-for-testing-public/133.0.6943.141/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;86;ZIP;132-132;https://storage.googleapis.com/chrome-for-testing-public/132.0.6834.159/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;131-131;https://storage.googleapis.com/chrome-for-testing-public/131.0.6778.264/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;130-130;https://storage.googleapis.com/chrome-for-testing-public/130.0.6723.69/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;129-129;https://storage.googleapis.com/chrome-for-testing-public/129.0.6668.58/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;128-128;https://storage.googleapis.com/chrome-for-testing-public/128.0.6613.119/mac-x64/chromedriver-mac-x64.zip	
CHR;MAC;64;ZIP;127-127;https://storage.googleapis.com/chrome-for-testing-public/127.0.6533.72/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;126-126;https://storage.googleapis.com/chrome-for-testing-public/126.0.6478.63/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;125-125;https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.76/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;124-124;https://storage.googleapis.com/chrome-for-testing-public/124.0.6367.91/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;123-123;https://storage.googleapis.com/chrome-for-testing-public/123.0.6312.58/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;122-122;https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.57/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;121-121;https://storage.googleapis.com/chrome-for-testing-public/121.0.6167.18400/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;120-120;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/120.0.6099.109/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;119-119;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/119.0.6045.105/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;118-118;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/118.0.5993.70/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;117-117;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/117.0.5938.88/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;116-116;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/116.0.5845.96/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;115-115;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/115.0.5790.170/mac-x64/chromedriver-mac-x64.zip
CHR;MAC;64;ZIP;114-114;https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_mac64.zip
CHR;MAC;64;ZIP;113-113;https://chromedriver.storage.googleapis.com/113.0.5672.24/chromedriver_mac64.zip
CHR;MAC;64;ZIP;112-112;https://chromedriver.storage.googleapis.com/112.0.5615.49/chromedriver_mac64.zip
CHR;MAC;64;ZIP;111-111;https://chromedriver.storage.googleapis.com/111.0.5563.41/chromedriver_mac64.zip
CHR;MAC;64;ZIP;110-109;https://chromedriver.storage.googleapis.com/110.0.5481.30/chromedriver_mac64.zip
CHR;MAC;64;ZIP;109-109;https://chromedriver.storage.googleapis.com/109.0.5414.74/chromedriver_mac64.zip
CHR;MAC;64;ZIP;108-108;https://chromedriver.storage.googleapis.com/108.0.5359.71/chromedriver_mac64.zip
CHR;MAC;64;ZIP;107-107;https://chromedriver.storage.googleapis.com/107.0.5304.62/chromedriver_mac64.zip
CHR;MAC;64;ZIP;106-106;https://chromedriver.storage.googleapis.com/106.0.5249.61/chromedriver_mac64.zip
CHR;MAC;64;ZIP;105-105;https://chromedriver.storage.googleapis.com/105.0.5195.52/chromedriver_mac64.zip
CHR;MAC;64;ZIP;104-104;https://chromedriver.storage.googleapis.com/104.0.5112.79/chromedriver_mac64.zip
CHR;MAC;64;ZIP;103-103;https://chromedriver.storage.googleapis.com/103.0.5060.134/chromedriver_mac64.zip
CHR;MAC;64;ZIP;102-102;https://chromedriver.storage.googleapis.com/102.0.5005.61/chromedriver_mac64.zip
CHR;MAC;64;ZIP;101-101;https://chromedriver.storage.googleapis.com/101.0.4951.41/chromedriver_mac64.zip
CHR;MAC;64;ZIP;100-100;https://chromedriver.storage.googleapis.com/100.0.4896.20/chromedriver_mac64.zip
CHR;MAC;64;ZIP;099-099;https://chromedriver.storage.googleapis.com/99.0.4844.51/chromedriver_mac64.zip
CHR;MAC;64;ZIP;098-098;https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_mac64.zip
CHR;MAC;64;ZIP;097-097;https://chromedriver.storage.googleapis.com/97.0.4692.36/chromedriver_mac64.zip
CHR;MAC;64;ZIP;096-096;https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_mac64.zip
CHR;MAC;64;ZIP;095-095;https://chromedriver.storage.googleapis.com/95.0.4638.69/chromedriver_mac64.zip
CHR;MAC;64;ZIP;094-094;https://chromedriver.storage.googleapis.com/94.0.4606.41/chromedriver_mac64.zip
CHR;MAC;64;ZIP;093-093;https://chromedriver.storage.googleapis.com/93.0.4577.15/chromedriver_mac64.zip
CHR;MAC;64;ZIP;092-092;https://chromedriver.storage.googleapis.com/92.0.4515.107/chromedriver_mac64.zip
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

CHR;LNX;86;ZIP;139-999;https://storage.googleapis.com/chrome-for-testing-public/139.0.7258.154/linux64/chromedriver-linux64.zip
CHR;LNX;86;ZIP;138-138;https://storage.googleapis.com/chrome-for-testing-public/138.0.7204.94/linux64/chromedriver-linux64.zip
CHR;LNX;86;ZIP;137-137;https://storage.googleapis.com/chrome-for-testing-public/137.0.7151.70/linux64/chromedriver-linux64.zip
CHR;LNX;86;ZIP;136-136;https://storage.googleapis.com/chrome-for-testing-public/136.0.7103.92/linux64/chromedriver-linux64.zip
CHR;LNX;86;ZIP;135-135;https://storage.googleapis.com/chrome-for-testing-public/135.0.7049.95/linux64/chromedriver-linux64.zip
CHR;LNX;86;ZIP;134-134;https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.88/linux64/chromedriver-linux64.zip
CHR;LNX;86;ZIP;133-133;https://storage.googleapis.com/chrome-for-testing-public/133.0.6943.141/linux64/chromedriver-linux64.zip
CHR;LNX;86;ZIP;132-132;https://storage.googleapis.com/chrome-for-testing-public/132.0.6834.159/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;131-131;https://storage.googleapis.com/chrome-for-testing-public/131.0.6778.264/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;130-130;https://storage.googleapis.com/chrome-for-testing-public/130.0.6723.69/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;129-129;https://storage.googleapis.com/chrome-for-testing-public/129.0.6668.58/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;128-128;https://storage.googleapis.com/chrome-for-testing-public/128.0.6613.119/linux64/chromedriver-linux64.zip		
CHR;LNX;64;ZIP;127-127;https://storage.googleapis.com/chrome-for-testing-public/127.0.6533.72/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;126-126;https://storage.googleapis.com/chrome-for-testing-public/126.0.6478.63/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;125-125;https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.76/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;124-124;https://storage.googleapis.com/chrome-for-testing-public/124.0.6367.91/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;123-123;https://storage.googleapis.com/chrome-for-testing-public/123.0.6312.58/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;122-122;https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.57/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;121-121;https://storage.googleapis.com/chrome-for-testing-public/121.0.6167.18400/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;120-120;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/120.0.6099.109/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;119-119;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/119.0.6045.105/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;118-118;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/118.0.5993.70/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;117-117;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/117.0.5938.88/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;116-116;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/116.0.5845.96/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;115-115;https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/115.0.5790.170/linux64/chromedriver-linux64.zip
CHR;LNX;64;ZIP;114-114;https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip
CHR;LNX;64;ZIP;113-113;https://chromedriver.storage.googleapis.com/113.0.5672.24/chromedriver_linux64.zip
CHR;LNX;64;ZIP;112-112;https://chromedriver.storage.googleapis.com/112.0.5615.49/chromedriver_linux64.zip
CHR;LNX;64;ZIP;111-111;https://chromedriver.storage.googleapis.com/111.0.5563.41/chromedriver_linux64.zip
CHR;LNX;64;ZIP;110-110;https://chromedriver.storage.googleapis.com/110.0.5481.30/chromedriver_linux64.zip
CHR;LNX;64;ZIP;109-109;https://chromedriver.storage.googleapis.com/109.0.5414.74/chromedriver_linux64.zip
CHR;LNX;64;ZIP;108-999;https://chromedriver.storage.googleapis.com/108.0.5359.71/chromedriver_linux64.zip
CHR;LNX;64;ZIP;107-107;https://chromedriver.storage.googleapis.com/107.0.5304.62/chromedriver_linux64.zip
CHR;LNX;64;ZIP;106-106;https://chromedriver.storage.googleapis.com/106.0.5249.61/chromedriver_linux64.zip
CHR;LNX;64;ZIP;105-105;https://chromedriver.storage.googleapis.com/105.0.5195.52/chromedriver_linux64.zip
CHR;LNX;64;ZIP;104-104;https://chromedriver.storage.googleapis.com/104.0.5112.79/chromedriver_linux64.zip
CHR;LNX;64;ZIP;103-103;https://chromedriver.storage.googleapis.com/103.0.5060.134/chromedriver_linux64.zip
CHR;LNX;64;ZIP;102-102;https://chromedriver.storage.googleapis.com/102.0.5005.61/chromedriver_linux64.zip
CHR;LNX;64;ZIP;101-101;https://chromedriver.storage.googleapis.com/101.0.4951.41/chromedriver_linux64.zip
CHR;LNX;64;ZIP;100-100;https://chromedriver.storage.googleapis.com/100.0.4896.20/chromedriver_linux64.zip
CHR;LNX;64;ZIP;099-099;https://chromedriver.storage.googleapis.com/99.0.4844.51/chromedriver_linux64.zip
CHR;LNX;64;ZIP;098-098;https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_linux64.zip
CHR;LNX;64;ZIP;097-097;https://chromedriver.storage.googleapis.com/97.0.4692.36/chromedriver_linux64.zip
CHR;LNX;64;ZIP;096-096;https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_linux64.zip
CHR;LNX;64;ZIP;095-095;https://chromedriver.storage.googleapis.com/95.0.4638.69/chromedriver_linux64.zip
CHR;LNX;64;ZIP;094-094;https://chromedriver.storage.googleapis.com/94.0.4606.41/chromedriver_linux64.zip
CHR;LNX;64;ZIP;093-093;https://chromedriver.storage.googleapis.com/93.0.4577.15/chromedriver_linux64.zip
CHR;LNX;64;ZIP;092-092;https://chromedriver.storage.googleapis.com/92.0.4515.107/chromedriver_linux64.zip
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
FIR;LNX;86;TGZ;128-999;https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-linux32.tar.gz
FIR;LNX;86;TGZ;115-127;https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-linux32.tar.gz
FIR;LNX;86;TGZ;115-115;https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-linux32.tar.gz
FIR;LNX;86;TGZ;103-114;https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-linux32.tar.gz
FIR;LNX;86;TGZ;102-102;https://github.com/mozilla/geckodriver/releases/download/v0.32.2/geckodriver-v0.32.2-linux32.tar.gz
FIR;LNX;86;TGZ;091-101;https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux32.tar.gz
FIR;LNX;86;TGZ;084-090;https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux32.tar.gz
FIR;LNX;86;TGZ;082-083;https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-linux32.tar.gz
FIR;LNX;86;TGZ;079-081;https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-linux32.tar.gz
FIR;LNX;86;TGZ;069-078;https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux32.tar.gz
FIR;LNX;86;TGZ;068-068;https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-linux32.tar.gz
FIR;LNX;86;TGZ;057-067;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux32.tar.gz
FIR;LNX;86;TGZ;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux32.tar.gz
FIR;LNX;86;TGZ;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux32.tar.gz
//FireFox linux 64
FIR;LNX;64;TGZ;128-999;https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-linux64.tar.gz
FIR;LNX;64;TGZ;115-127;https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-linux64.tar.gz
FIR;LNX;64;TGZ;115-115;https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-linux64.tar.gz
FIR;LNX;64;TGZ;103-114;https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-linux64.tar.gz
FIR;LNX;64;TGZ;102-102;https://github.com/mozilla/geckodriver/releases/download/v0.32.2/geckodriver-v0.32.2-linux64.tar.gz
FIR;LNX;64;TGZ;091-101;https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux64.tar.gz
FIR;LNX;64;TGZ;084-090;https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz
FIR;LNX;64;TGZ;082-083;https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-linux64.tar.gz
FIR;LNX;64;TGZ;079-081;https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-linux64.tar.gz
FIR;LNX;64;TGZ;069-078;https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
FIR;LNX;64;TGZ;068-068;https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-linux64.tar.gz
FIR;LNX;64;TGZ;057-067;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
FIR;LNX;64;TGZ;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz
FIR;LNX;64;TGZ;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-linux64.tar.gz
//FireFox windows 86
FIR;WIN;86;ZIP;128-999;https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-win32.zip
FIR;WIN;86;ZIP;115-127;https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-win32.zip
FIR;WIN;86;ZIP;115-115;https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-win32.zip
FIR;WIN;86;ZIP;103-114;https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-win32.zip
FIR;WIN;86;ZIP;102-102;https://github.com/mozilla/geckodriver/releases/download/v0.32.2/geckodriver-v0.32.2-win32.zip
FIR;WIN;86;ZIP;091-101;https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-win32.zip
FIR;WIN;86;ZIP;084-090;https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-win32.zip
FIR;WIN;86;ZIP;082-083;https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-win32.zip
FIR;WIN;86;ZIP;079-081;https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-win32.zip
FIR;WIN;86;ZIP;069-078;https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-win32.zip
FIR;WIN;86;ZIP;068-068;https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-win32.zip
FIR;WIN;86;ZIP;057-067;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-win32.zip
FIR;WIN;86;ZIP;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win32.zip
FIR;WIN;86;ZIP;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-win32.zip
//FireFox windows 64
FIR;WIN;64;ZIP;128-999;https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-win64.zip
FIR;WIN;64;ZIP;115-127;https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-win64.zip
FIR;WIN;64;ZIP;115-115;https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-win64.zip
FIR;WIN;64;ZIP;103-114;https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-win64.zip
FIR;WIN;64;ZIP;102-102;https://github.com/mozilla/geckodriver/releases/download/v0.32.2/geckodriver-v0.32.2-win64.zip
FIR;WIN;64;ZIP;091-101;https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-win64.zip
FIR;WIN;64;ZIP;084-090;https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-win64.zip
FIR;WIN;64;ZIP;082-083;https://github.com/mozilla/geckodriver/releases/download/v0.28.0/geckodriver-v0.28.0-win64.zip
FIR;WIN;64;ZIP;079-081;https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-win64.zip
FIR;WIN;64;ZIP;069-078;https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-win64.zip
FIR;WIN;64;ZIP;068-068;https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-win64.zip
FIR;WIN;64;ZIP;057-067;https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-win64.zip
FIR;WIN;64;ZIP;055-056;https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win64.zip
FIR;WIN;64;ZIP;053-054;https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-win64.zip
//FireFox mac 64
FIR;MAC;64;TGZ;128-999;https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-macos.tar.gz
FIR;MAC;64;TGZ;115-127;https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-macos.tar.gz
FIR;MAC;64;TGZ;115-115;https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-macos.tar.gz
FIR;MAC;64;TGZ;103-114;https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-macos.tar.gz
FIR;MAC;64;TGZ;102-102;https://github.com/mozilla/geckodriver/releases/download/v0.32.2/geckodriver-v0.32.2-macos.tar.gz
FIR;MAC;64;TGZ;091-101;https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-macos.tar.gz
FIR;WIN;64;ZIP;084-090;https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-win64.zip
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
EDG;WIN;64;EXE;112-112;https://msedgedriver.azureedge.net/112.0.1722.0/edgedriver_win64.zip
EDG;WIN;64;EXE;111-111;https://msedgedriver.azureedge.net/111.0.1641.0/edgedriver_win64.zip
EDG;WIN;64;EXE;110-110;https://msedgedriver.azureedge.net/110.0.1535.0/edgedriver_win64.zip
EDG;WIN;64;EXE;081-109;https://msedgedriver.azureedge.net/109.0.1517.0/edgedriver_win64.zip
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
EDG;WIN;32;EXE;112-999;https://msedgedriver.azureedge.net/112.0.1722.0/edgedriver_win32.zip
EDG;WIN;32;EXE;111-111;https://msedgedriver.azureedge.net/111.0.1641.0/edgedriver_win32.zip
EDG;WIN;32;EXE;110-110;https://msedgedriver.azureedge.net/110.0.1535.0/edgedriver_win32.zip
EDG;WIN;32;EXE;081-109;https://msedgedriver.azureedge.net/109.0.1517.0/edgedriver_win32.zip
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

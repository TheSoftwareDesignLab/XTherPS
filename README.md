[![Build Status](https://greensqa.visualstudio.com/XTherPS/_apis/build/status/XTherCI?branchName=master)](https://greensqa.visualstudio.com/XTherPS/_build/latest?definitionId=125&branchName=master)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# About XTherPS 
[![N|Solid](https://github.com/TheSoftwareDesignLab/XTherPS/blob/master/Img/XTherPSSmall.png)](http://www.greensqa.com)
<br>
XTherPS is a cross-platform utility created by [GreenSQA](https://greensqa.com/en) for avoiding compatibility issues among selenium standalone server, web drivers and browsers. It is coded in PowerShell Core; therefore, it runs on Windows, Mac, and Linux. Supported resources are:

- Selenium Stand-Alone Server(STD): Supports the Selenium Stand Alone Server compatible with the java version of the running machine

- Chrome Driver (CHR): Google Chrome browser supported from version 66

- Gecko Driver (FIR): Firefox browser supported from version 53 

- Edge Web Driver (EDG): Microsoft Edge browser supported from version 12

# Motivation
Compatibility issues between web drivers, browsers and Selenium stand-alone frequently appear when new versions of either of them are released. Updating the browser typically breaks CI and CD pipelines requiring human intervention to also update selenium resources in the running machine to those with the correct compatibility.
Is a hassle for development or testing teams to manually update their packaged apps, testing environments or virtual machine images; with XTherPS that manual activity disappears. XTherPS supporting team will always keep an updated compatibility database of selenium URL resources for ensuring that XTherPS will always install the right Selenium resource for you.

# Getting Started

1. Download and Install Microsoft Powershell (minimum version powershell 5.1 or powershell core 6.1)
2. Download and run [XTherPS.ps1](https://raw.githubusercontent.com/TheSoftwareDesignLab/XTherPS/master/XTherPS.ps1) indicating the comma separated list of resources and the installation directory
3. For MacOS or Linux run:
```sh
#Note: STD = Selenium Stand-alone; CHR = Google-Chrome; FIR = Firefox; EDG = Edge
pwsh XTherPS.ps1 -resources "STD,CHR,FIR,EDG" -installDir '/Users/eider/Selenium'
```
4.	For Windows right click the downloaded file XTherPS.ps1 and unlock security and then run:
```sh
#Note: STD = Selenium Stand-alone; CHR = Google-Chrome; FIR = Firefox; EDG = Edge
powershell ./XTherPS.ps1 -resources "STD,CHR,FIR,EDG" -installDir 'C:\greensqa\selenium'
```

License
----

MIT

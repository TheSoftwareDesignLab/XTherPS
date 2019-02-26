![Tests](https://img.shields.io/azure-devops/tests/greensqa/xtherps/125.svg?compact_message) 
![Test Coverage](https://img.shields.io/azure-devops/coverage/greensqa/xtherps/125.svg?label=code%20coverage)
![Build Status](https://img.shields.io/azure-devops/build/greensqa/xtherps/129.svg?label=Windows%20Buid)
![Build Status](https://img.shields.io/azure-devops/build/greensqa/xtherps/128.svg?label=Mac%20Buid)
![Build Status](https://img.shields.io/azure-devops/build/greensqa/xtherps/127.svg?label=Linux%20Buid)


# About XTherPS 
[![N|Solid](https://greensqa.gallerycdn.vsassets.io/extensions/greensqa/build-release-task/1.0.24/1551112592093/Microsoft.VisualStudio.Services.Icons.Default)](http://www.greensqa.com)

XTherPS is a cross-platform utility created by [GreenSQA](https://greensqa.com/en) for avoiding compatibility issues among selenium standalone server, web drivers and browsers. It is coded in PowerShell Core; therefore, it runs on Windows, Mac, and Linux. Supported resources are:

- Selenium Stand-Alone Server (STD): Supports the Selenium Stand Alone Server compatible with the java version of the running machine

- Chrome Driver (CHR): Google Chrome browser supported from version 66

- Gecko Driver (FIR): Firefox browser supported from version 53 

- Edge Web Driver (EDG): Microsoft Edge browser supported from version 12

XTherPS is available via Azure DevOps extension [check it out here](https://marketplace.visualstudio.com/items?itemName=GreenSQA.build-release-task)

# Motivation
Compatibility issues between web drivers, browsers and Selenium stand-alone frequently appear when new versions of either of them are released. Updating the browser typically breaks CI and CD pipelines requiring human intervention to also update selenium resources in the running machine to those with the correct compatibility.
Is a hassle for development or testing teams to manually update their packaged apps, testing environments or virtual machine images; with XTherPS that manual activity disappears. XTherPS supporting team will always keep an updated compatibility database of selenium URL resources for ensuring that XTherPS will always install the right Selenium resource for you.

# Getting Started

1. Download and Install Microsoft Powershell (minimum version powershell 5.1 or powershell core 6.1)
2. Download and run [XTherPS.ps1](https://raw.githubusercontent.com/TheSoftwareDesignLab/XTherPS/master/XTherPS.ps1) indicating the installation directory and the comma separated list of resources (STD is Selenium Stand-alone, CHR is Google-Chrome, FIR is Firefox, EDG is Edge)
3. For MacOS or Linux run:
```sh
pwsh XTherPS.ps1 -resources "STD,CHR,FIR,EDG" -installDir '/Users/eider/Selenium'
```
4.	For Windows right click the downloaded file XTherPS.ps1 and unlock security and then run:
```sh
powershell ./XTherPS.ps1 -resources "STD,CHR,FIR,EDG" -installDir 'C:\greensqa\selenium'
```

License
----

MIT

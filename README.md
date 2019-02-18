# About XTherPS 
[![N|Solid](https://github.com/TheSoftwareDesignLab/XTherPS/blob/master/Img/XTherPSSmall.png)](http://www.greensqa.com)
<br>
XTherPS is a cross-platform utility created by [GreenSQA](https://greensqa.com/en) for avoiding compatibility issues among selenium standalone server, web drivers and browsers. It is coded in PowerShell Core; therefore, it runs on Windows, Mac, and Linux. Supported resources are:

- STD-SeleniumStandAlone: Supports the Selenium Stand Alone Server compatible with the java version of the running machine

- CHR-Chromedriver: Google Chrome browser supported from version 66

- FIR-Geckodriver: Firefox browser supported from version 53 

- EDG-EdgeWebdriver: Microsoft Edge browser supported from version 12

# Motivation
Compatibility issues between web drivers, browsers and Selenium stand-alone frequently appear when new versions of either of them are released. Updating the browser typically breaks CI and CD pipelines requiring human intervention to also update selenium resources in the running machine to those with the correct compatibility.
Is a hassle for development or testing teams to manually update their packaged apps, testing environments or virtual machine images; with XTherPS that manual activity disappears. XTherPS supporting team will always keep an updated compatibility database of selenium URL resources for ensuring that XTherPS will always find the right Selenium resource for you.

# Getting Started

1. Download and Install Microsoft Powershell (minimum version powershell 5.1 or powershell core 6.1)
2. Run XTherPS indicating the comma separated list of resources and the installation directory
3. For MacOS or Linux run:
```sh
pwsh XTherPS.ps1 -resources "STD,CHR,FIR,EDG" -installDir '/Users/eider/Selenium'
```
4.	For Windows run: 
```sh
powershell ./XTherPS.ps1 -resources "STD,CHR,FIR,EDG" -installDir 'C:\greensqa\selenium'
```

License
----

MIT
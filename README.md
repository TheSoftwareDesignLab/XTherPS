# About XTherPS 
[![N|Solid](https://github.com/TheSoftwareDesignLab/XTherPS/blob/master/Img/XTherPSSmall.png)](http://www.greensqa.com)
<br>
Installs the Web Drivers compatible with the installed web browsers into the running machine. Also installs the latest version of the selenium stand alone server. XTherPS is develped in PowerShell Core therefore it runs on Windows, Mac and Linux; the supported resources are:

- STD-SeleniumStandAlone: Supports the Selenium Stand Alone Server compatible with the java version of the running machine

- CHR-Chromedriver: Google Chrome browser supported from version 66

- FIR-Geckodriver: Firefox browser supported from version 53

- EDG-EdgeWebdriver: Microsoft Edge browser supported from version 12


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
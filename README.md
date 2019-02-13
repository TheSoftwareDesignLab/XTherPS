# About XTherPS 
[![N|Solid](https://github.com/TheSoftwareDesignLab/XTherPS/blob/master/Img/XTherPSSmall.png)](http://www.greensqa.com)
<br>
Installs the compatible Web Drivers with the installed web browsers in a target machine. Also installs the latest version of the selenium stand alone server. XTherPS is develped in PowerShell Core therefore it runs on Windows, Mac and Linux; the supported resources are:

- STD-SeleniumStandAlone: Supports a compatible version of selenium stand alone with the java version installed

- CHR-Chromedriver: Supports Google Chrome browser since version 66

- FIR-Geckodriver: Supports Firefox browser since version 53

- EDG-EdgeWebdriver: Supports Edge browser since version 12


# Getting Started

1. Download and Install Microsoft Powershell
2. Run XTher indicating the comma separated list of resources and the installation directory
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
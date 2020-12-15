
# Monitor Windows Services through Powershell

Monitor, Start and Stop Services on various Windows Server editions

Howto initial install:

1. Download and save All files to your desktopfolder, (re)name this folder to "qservices" (small-caps)
2. Change the main Variables script "qservices_variables.ps1" to your needs
3. Change Service values in "laptop_test.ps1, laptop_down.ps1 and laptop_up.ps1"
4. Run "laptop_menu.ps1"

Howto add more Windows Server scripts:

1. Copy "laptop_test.ps1, laptop_down.ps1 and laptop_up.ps1" to an alternative [server-name]_[test/down/up].ps1 file
2. Make sure your sequence numbering and services in these scripts are correct.
3. Copy and (re)name "laptop_menu.ps1" according the same naming convention.
4. Run "[server-name]_menu.ps1"

There are a few other options to select from in the menu (e.g. View Log-Folder, Check Hardware, Check Variables)
The basic Controller scripts provide you with 80 different Service listings, you can add more to extend these scripts to more Servers and/or Services

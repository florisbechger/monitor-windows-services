# windows
Powershell Services test/stert/stop script

Howto install:

1. Download and save All files to a desktopfolder, (re)name this folder to "qservices" (small-caps)
2. Change the main Variables script "qservices_variables.ps1" to your needs
3. Change Service values in "laptop_test.ps1, laptop_down.ps1 and laptop_up.ps1"
4. Run "laptop_menu.ps1"

You can copy "laptop_test.ps1, laptop_down.ps1 and laptop_up.ps1" to an alternative [server-name]_[test/down/up].ps1 file
Make sure your sequence numbering and services are correct.
Copy and (re)name "laptop_menu.ps1" according the same naming convention.
Run "[server-name]_menu.ps1"

There are a few other options to select from in the menu (e.g. Select Log-Folder, Check Hardware, Check Variables)
The basic Controller scripts provide you with 80 different Service listings, you can add more of course

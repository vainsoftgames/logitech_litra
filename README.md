# logitech_litra
Ability to control Logitech Litra Lights via Powershell. Wanted the ability to control the lights via my Stream Deck.

This powershell script does require an external executable to function.
HIDAPITester allows for communication with USB Devices
https://github.com/todbot/hidapitester




Control Brightness
You can change the last value to any number between 1 to 100

100%
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" brightness 100
50%
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" brightness 50
10%
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" brightness 10

Turn Light On/Off
On
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" on

Off
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" off

# logitech_litra
Ability to control Logitech Litra Lights via Powershell. Wanted the ability to control the lights via my Stream Deck.

This powershell script does require an external executable to function.
HIDAPITester allows for communication with USB Devices
https://github.com/todbot/hidapitester


To control your lights via a Stream Deck.
<br>
<br>1). Add a button
<br>2). Under the System menu, add "Open"

Before adding the App / File path, replace [PATH_TO_PS1_SCRIPT] with the directory of the litra.ps1
<br>Ex: D:\Litra_Lights
<br>3). After replacing that string, copy the full command into the App / File path for your new button.



<br><br>
<b>Control Brightness</b>
<br>You can change the last value to any number between 1 to 100
<br><br>
<b>100%</b><br>
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" brightness 100
<br><br>
<b>50%</b><br>
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" brightness 50
<br><br>
<b>10%</b><br>
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" brightness 10
<br><br><br>

<b><big>Turn Light On/Off</big></b>
<br><br>
<b>On</b><br>
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" on
<br><br>
<b>Off</b><br>
powershell -windowstyle hidden -nologo -executionpolicy bypass -File "[PATH_TO_PS1_SCRIPT]\litra.ps1" off

# Define the USB device path for the Logitech Litra Beam light
# resources
# https://github.com/todbot/hidapitester
# https://github.com/dandean/logitech-litra-beam/blob/main/src/main.ts
$hid = $PSScriptRoot+"\hidapitester.exe"
$HID_VID = "046D"
$HID_PID = "C901"
$HID_UID = "FF43"


$WARM = 2700;
$COOL = 6500;
$NEUTRAL = ($COOL - $WARM) / 2 + $WARM;


function Find-LitraLights {
    $output = cmd.exe /c "$hid" --vidpid 046D/C901 --list-detail

    Write-Host $output
}

function hid($output){
    Write-Host $output
    $cmd_output = cmd.exe /c "$hid" --vidpid $HID_VID +"/"+ $HID_PID --usagePage $HID_UID --open --length 20 --send-output $output
    Write-Host $cmd_output
}

function Set-Brightness([int]$brightness) {
    if ($brightness -lt 0 -or $brightness -gt 100) {
        Write-Host "Brightness must be between 0 and 100."
        return
    }
    $brightness = [math]::Round(($brightness * (255 - 30)) / 255 + 30);
    hid('0x11,0xff,0x04,0x4f,0x00,'+ $brightness);
}
function Set-Temperature([int]$temperature) {
    if ($temperature -lt $WARM -or $temperature -gt $COOL) {
        Write-Host "Temperature must be between $WARM and $COOL."
        return
    }

    $temp = [math]::Min([math]::Max($temperature, $WARM), $COOL);
    $hexTemp = [convert]::ToString($temp, 16).PadLeft(4, '0').ToUpper()
    
    $first = [int]$hexTemp.substring(0, 2)
    $second = [int]$hexTemp.substring(2)
    
    #hid('0x11,0xff,0x04,0x4f,0x9d,'+ $first +','+ $second);
    hid('0x11,0xff,0x04,0x9c,'+ $first +','+ $second);
    #hid('0x11,0xff,0x04,0x9c,25,100');
}

function Turn-On {
    hid('0x11,0xff,0x04,0x1c,0x01')
}

function Turn-Off {
    hid('0x11,0xff,0x04,0x1c,0x00')
}

# Check for passed arguments
if ($args.Count -eq 0) {
    Find-LitraLights
}
else {
    switch ($args[0]) {
        "on" {
            Turn-On
        }
        "off" {
            Turn-Off
        }
        "brightness" {
            Set-Brightness $args[1]
        }
        "temperature" {
            Set-Temperature $args[1]
        }
        "temp" {
            Set-Temperature $args[1]
        }
	"findlights" {
		Find-LitraLights
	}
        default {
            Write-Host "Invalid argument. Use 'on', 'off', 'brightness' or 'temperature'."
        }
    }
}

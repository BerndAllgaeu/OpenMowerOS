# WiFi Country Code Configuration

OpenMowerOS comes with a default WiFi country code set to "DE" (Germany) 
to prevent the "WiFi is currently blocked by rfkill" issue.

## Changing the Country Code

1. Open the SD card on your computer
2. Navigate to the boot partition
3. Edit the file "config.txt"
4. Find the line: country=DE
5. Change "DE" to your country code

## Common Country Codes:
- US = United States
- DE = Germany  
- GB = United Kingdom
- FR = France
- IT = Italy
- ES = Spain
- NL = Netherlands
- AU = Australia
- CA = Canada
- JP = Japan

## Why is this needed?

The Raspberry Pi's WiFi is regulated by radio frequency laws. Without
a valid country code, the system blocks WiFi to comply with regulations.
Setting the correct country code ensures:
- WiFi works immediately on first boot
- Correct frequency channels are used
- Legal compliance with local radio regulations

## Troubleshooting

If WiFi is still blocked after setting the country code:
1. SSH into your OpenMower: ssh openmower@<ip-address>
2. Run: sudo rfkill unblock wifi
3. Restart NetworkManager: sudo systemctl restart NetworkManager

For persistent issues, check:
- sudo rfkill list
- sudo journalctl -u comitup
- sudo journalctl -u NetworkManager

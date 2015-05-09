#!/system/bin/sh

#adb shell
# Get wpa_cli prompt
#wpa_cli -p /data/misc/wifi/sockets/ -i wlan0

# Add new WiFi network
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ scan
#wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ scan_result
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ remove_network 0
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ add_network
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ set_network 0 auth_alg OPEN
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ set_network 0 key_mgmt WPA-PSK
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ set_network 0 ssid '"Actions-TPE5G"'
sleep 1
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ set_network 0 psk '"semi4378"'
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ set_network 0 proto WPA RSN
#wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ set_network 0 mode 0

# Connect to it
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ select_network 0
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ enable_network 0
wpa_cli -iwlan0 -p/data/misc/wifi/sockets/ reassociate

# Check the status
#status

# Leave wpa_cli
#quit

# Get IP using DHCP
#dhcpcd wlan0

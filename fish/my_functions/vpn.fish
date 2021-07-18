function vpn
	function vpn-on
		echo "Connecting"
		nmcli connection up id ADI
	end

	function vpn-off
		echo "Disconnecting"
		nmcli connection down id ADI
	end

	if test (count $argv) -lt 1
		set connected (count (nmcli connection show --active id ADI))
		if test $connected -eq 0
			vpn-on
		else
			vpn-off
		end
	else
		set command $argv[1]
		if test $command = 'on'
			vpn-on
		else if test $command = 'off'
			vpn-off
		else
			echo 'use "on" or "off"'
		end
	end
end

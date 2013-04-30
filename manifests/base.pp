class dockutil::base {

	exec {"refresh dock": 
		command =>  "${boxen::config::cachedir}/dockutil/scripts/dockutil --list && killall -HUP Dock",
		refreshonly => true,
	}

} 

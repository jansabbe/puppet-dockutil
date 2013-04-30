class dockutil::base {

	exec {"refresh dock": 
		command =>  "${boxen::config::cachedir}/dockutil/scripts/dockutil --list > /dev/null ; killall Dock",
		refreshonly => true,
	}

} 

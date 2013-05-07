class dockutil::base {

	exec {"refresh dock": 
		command =>  "sleep 10 && killall Dock && ${boxen::config::cachedir}/dockutil/scripts/dockutil --list && killall Dock",
		refreshonly => true,
		notify => Exec["refresh dock again"]
	}	
	exec {"refresh dock again": 
		command =>  "sleep 10 && killall Dock && ${boxen::config::cachedir}/dockutil/scripts/dockutil --list && killall Dock",
		refreshonly => true,
	}
} 

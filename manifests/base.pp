class dockutil::base {

	exec {"refresh dock": 
		command =>  "killall Dock && ${boxen::config::cachedir}/dockutil/scripts/dockutil --list && killall Dock",
		refreshonly => true,
	}

} 

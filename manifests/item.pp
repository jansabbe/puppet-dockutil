define dockutil::item (
	$item = "unset", 
	$label, 
	$action = "add", 
	$position = "unset",
	)
{
include dockutil::base

validate_re($action, '^(add|remove)$',
"${action} is not supported for action.
Allowed values are 'add' and 'remove'.")

case $action {
	"add":{
		exec {"dockutil-$action-$label-add":
			command => $position ? {
				"unset" => "${boxen::config::cachedir}/dockutil/scripts/dockutil --${action} \"${item}\" --label \"${label}\" --no-restart",
				default => "${boxen::config::cachedir}/dockutil/scripts/dockutil --${action} \"${item}\" --label \"${label}\" --position ${position} --no-restart",
				},
			onlyif => "${boxen::config::cachedir}/dockutil/scripts/dockutil --find \"${label}\" | grep -qx \"${label} was not found in /Users/${::luser}/Library/Preferences/com.apple.dock.plist\"",
			require => Repository['Dockutil'],
			notify => Exec['refresh dock']
		}
	}
	
	"remove":{
		exec {"dockutil-$label-$item":
			require => Repository['Dockutil'],
			command => "${boxen::config::cachedir}/dockutil/scripts/dockutil --remove \"${label}\" --no-restart",
			onlyif => "${boxen::config::cachedir}/dockutil/scripts/dockutil --find \"${label}\" | grep -q \"${label} was found\"",
			notify => Exec['refresh dock']
		}
	}

}

}

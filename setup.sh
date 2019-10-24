#!/bin/sh
#  _____ _____ _____ _   _______    _
# /  ___|  ___|_   _| | | | ___ \  | |
# \ `--.| |__   | | | | | | |_/ /__| |__
#  `--. \  __|  | | | | | |  __/ __| '_ \
# /\__/ / |___  | | | |_| | |_ \__ \ | | |
# \____/\____/  \_/  \___/\_(_)|___/_| |_|
#
# Setup my configuration files by tangling and linking each file.

set -e # Exit out on any errors

main() {
		# Set envvar DEBUG to true to print tracing information.
		[ "$DEBUG" = true ] && set -x

		tangle_org_files
		link_config_file fish config.fish
		link_config_file tmux tmux.config
		link_config_file nvim init.vim
}

# Print arg1 to the screen, and exit with a code defined in arg2.
error() {
		# Redirect echo to STDERR
		echo "$1" >&2
		exit "$2"
}

tangle_org_files() {
		# Ensure Emacs is available on the machine. If it is not, raise an error.
		command -v emacs >/dev/null 2>&1 || error 'Emacs not found' 1

		# Loop through each org file in the current directory, and invoke Emacs to
		# use org-babel to untangle them. This results in some amount of source code
		# files being extracted from the org files.
		#
		# The resulting source code will be the actual, parsable configuration files for
		# each respective application.
		for org_file in *.org; do
				# Ensure at least one org-mode file exists. If not, raise an error.
				[ -e "$org_file" ] || error 'No org-mode files found' 2

				emacs --batch --load=org --quick --eval "(org-babel-tangle-file \"$org_file\")"
		done
}

link_config_file() {
		# Symbolically link a configuration file to its respective directory. The
		# directory name is based on the passed in application name.
		#
		# The directories follow the pattern of the Freedesktop.org user configuration
		# directory, then a sub-directory with the same name as the application. This is
		# determined by looking at the name of the configuration file without the file
		# extension.

		# Set the arguments to human understandable names.
		application_name="$1"
		config_file_name="$2"

		# Ensure at least one configuration file exists. If not, raise an error.
		[ -e "$config_file_name" ] || error "Config file $config_file_name not found" 3

		# Set the target directory based on the pattern mentioned above. To get the
		# user configuration directory, first check the standard $XDG_CONFIG_HOME
		# environment variable. If the variable is not set, it is defaulted to
		# $HOME/.config. This is done in the expansion below.
		#
		# ${TARGET_VARIABLE-DEFAULT_VALUE}
		target_dir="${XDG_CONFIG_HOME-$HOME/.config}/$application_name"

		# Create the _entire_ directory tree. If any of the directories already
		# exist, then they are ignored.
		mkdir --parents "$target_dir"

		# Create a symbolic link of the configuration file inside the target
		# configuration directory. The --force flag removes any existing symbolic
		# links instead of exiting with an error.
		#
		# The file to be linked needs to be reference with an absolute path. To get
		# the absolute path, readlink is evoked. --canonicalize makes sure to follow
		# symbolic links if needed (it shouldn't be needed, but it doesn't hurt to
		# have.
		ln --symbolic --force "$(readlink --canonicalize "$config_file_name")" \
			 "$target_dir/$config_file_name"
}

main "$@"

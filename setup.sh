#!/bin/sh
#  _____ _____ _____ _   _______    _
# /  ___|  ___|_   _| | | | ___ \  | |
# \ `--.| |__   | | | | | | |_/ /__| |__
#  `--. \  __|  | | | | | |  __/ __| '_ \
# /\__/ / |___  | | | |_| | |_ \__ \ | | |
# \____/\____/  \_/  \___/\_(_)|___/_| |_|
#
# Setup my configuration files by tangling and linking each file dynamically.
# Handles an arbitrary amount of files with arbitrary names, with no hard
# coding required.

set -e # Exit out on any errors

# Print arg1 to the screen, and exit with a code defined in arg2.
error() {
		# Redirect echo to STDERR
		echo "$1" >&2
		exit "$2"
}

# Set envvar DEBUG to true to print tracing information.
[ "$DEBUG" = true ] && set -x

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

# Loop through each configuration file in the current directory, and symbolically
# link it to their respective directories.
#
# The directories follow the pattern of the Freedesktop.org user configuration
# directory, then a sub-directory with the same name as the application. This is
# determind by looking at the name of the configuration file without the file
# extention.
for config_file in *.config; do
		# Ensure at least one configuration file exists. If not, raise an error.
		[ -e "$config_file" ] || error 'No config files found' 3

		# Set the target directory based on the pattern mentioned above. To get the
		# user configuration directory, first check the standard XDG_CONFIG_HOME
		# environment variable. If the variable is not set, it is defaulted to
		# HOME/.config. This is done in the expansion below.
		#
		# ${TARGET_VARIABLE-DEFAULT_VALUE}
		#
		# To get the application name from the filename, we evoke basename with the
		# filename and the extention we want truncated.
		target_dir="${XDG_CONFIG_HOME-$HOME/.config}/$(basename "$config_file" .config)"

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
		ln --symbolic --force "$(readlink --canonicalize "$config_file")" "$target_dir/$config_file"
done

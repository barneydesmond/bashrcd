#!/usr/bin/env bash
# vim: syntax=sh
# .bashrc

# This loads all the shell enhancements, which are intended for INTERACTIVE
# SHELLS ONLY.

case "$-" in
	*i*)
		logger "  Starting ~/.bashrc for ${TERM}"
		echo   "  Starting ~/.bashrc for ${TERM}"

		logger "    Shell is interactive, enhancing... "
		echo   "    Shell is interactive, enhancing... "

		logger "    Starting profile fragments"
		for profile in $(find ~/.bashrc.d/ -maxdepth 1 -type f -name '[0-9]*.sh' | sort) ; do
			if tty -s ; then
				echo -n "      Sourcing $(basename ${profile})... "
			fi
			source "$profile"
			if tty -s ; then
				echo "Done"
			fi
		done
		logger "    Finished profile fragments"

		logger "  Finished ~/.bashrc for ${TERM}"
		echo   "  Finished ~/.bashrc for ${TERM}"
		;;
	*)
		logger "  Starting ~/.bashrc for ${TERM}"
		logger "    This shell NOT is interactive, relax. "
		logger "  Finished ~/.bashrc for ${TERM}"
		;;
esac

#!/bin/bash

alias cf='cd ~/git/cfengine/trunk ; svn up'
alias pup='cd ~/git/dec-puppet ; make -C ~/git/dec-puppet pull'

if [ -f ~/git/dec-tools/bin/bump_branch_completions ] ; then
	. ~/git/dec-tools/bin/bump_branch_completions
fi

alias kw='svn ps svn:keywords "Id URL"'

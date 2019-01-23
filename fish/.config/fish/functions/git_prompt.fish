# vim: set noet:
#
# Set the git prompt command.

function git_prompt --description "Write out the current git branch to the prompt"
	if set -l git_branch (git branch 2> /dev/null)
		echo -n -s " (" (set_color yellow) (string join \n $git_branch | awk '/\*/{ print $2 }') (set_color normal) ")"
	end
end

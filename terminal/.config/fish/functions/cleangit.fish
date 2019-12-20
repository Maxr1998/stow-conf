function cleangit --description 'Remove unused git objects'
	git reflog expire --expire=now --all; and git gc --prune=now --aggressive $argv;
end

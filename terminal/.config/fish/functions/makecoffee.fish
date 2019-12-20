function makecoffee --description 'Make a cup of coffee'
	if test ! -f /tmp/coffee
		curl -L git.io/hotcoffee 2> /dev/null > /tmp/coffee
	end
	cat /tmp/coffee | sh
end

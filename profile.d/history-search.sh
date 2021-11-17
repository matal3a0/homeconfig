#History search with arrowkeys
if [ -t 1 ]
then
	        bind '"\x1b\x5b\x41":history-search-backward'
		        bind '"\x1b\x5b\x42":history-search-forward'
fi


#Keep history between sessions
shopt -s histappend

# start/attach tmux session
# use function in .zshrc to attach at every login
autotmux()
{
	if [ -z "$TMUX" ]; then
		# get the id of a deattached session
		ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
		if [ -z "$ID" ]; then
			tmux new-session
		else
			tmux attach-session -t "$ID"
		fi
	fi 
}

checkpem()
{
	openssl x509 -in "$1" -noout -text
}
checkcert()
{
	openssl s_client -connect "$1":443 2>/dev/null
}

# works only without tex-ending
tex2pdf()
{
	pdflatex "$1"
	bibtex "$1"
	pdflatex "$1"
	pdflatex "$1"
}

startx()
{
	nohup startx "$@" > /dev/null 2>&1 &
	disown
	vlock
}

# generate qrcode and display it
func_qrcode()
{
	qrencode "$1" -o - | feh -
}
# Create alias calling the function with space prefix, so that it is not logged in history file. This avoids logging passwords and stuff.
alias qrcode=" func_qrcode"

ogg2mp3()
{
	for file in *ogg; do
		ffmpeg -i $file -b:a 192k -map_metadata 0:s:a:0 "${file%.*}.mp3"
	done
}
m4a2mp3()
{
	for file in *m4a; do
		ffmpeg -i $file -b:a 192k -map_metadata 0:s:a:0 "${file%.*}.mp3"
	done
}

# show the current mode:
#PR_VIMODE="#"
#function zle-keymap-select
#{
#        PR_VIMODE="${${KEYMAP/vicmd/Â¢}/(main|viins)/$}"
#	zle reset-prompt
#}
#zle -N zle-keymap-select

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
pem2crt()
{
	openssl x509 -inform PEM -in "$1" -out "${1%.*}.crt"
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

# Show all blob objects in repo sorted from smalles to largest
# https://stackoverflow.com/a/42544963
git-blobs()
{
	git rev-list --objects --all --missing=print |
	  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
	  sed -n 's/^blob //p' |
	  sort --numeric-sort --key=2 |
	  cut -c 1-12,41- |
	  $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
}

# Do a short code review via several git commands
# https://piechowski.io/post/git-commands-before-reading-code/
git-review()
{
	echo "### What Changes the Most (1y ago) ###"
	git log --format=format: --name-only --since="1 year ago" | sort | uniq -c | sort -nr | head -20
	echo "\n### Who Built This ###"
	git --no-pager shortlog -sn --no-merges
	echo "\n### Where Do Bugs Cluster ###"
	git log -i -E --grep="fix|bug|broken" --name-only --format='' | sort | uniq -c | sort -nr | head -20
	echo "\n### Is This Project Accelerating or Dying (commit count per m) ###"
	git log --format='%ad' --date=format:'%Y-%m' | sort | uniq -c
	echo "\n### How Often Is the Team Firefighting ###"
	git log --oneline --since="1 year ago" | grep -iE 'revert|hotfix|emergency|rollback'
}

sshs()
{
	tmprc=$(ssh $1 "mktemp --directory")
	scp -q $HOME/.zshrc $1:$tmprc
	ssh -t $1 "export ZDOTDIR=${tmprc}; trap 'rm -rf ${tmprc}' EXIT INT TERM; exec zsh"
	#ssh $1 "rm -rf ${tmprc}"
}

# show the current mode:
#PR_VIMODE="#"
#function zle-keymap-select
#{
#        PR_VIMODE="${${KEYMAP/vicmd/Â¢}/(main|viins)/$}"
#	zle reset-prompt
#}
#zle -N zle-keymap-select

# Load version control information
autoload -Uz vcs_info
# Show branch information in brackets
zstyle ':vcs_info:git:*' formats '(%b)'
precmd() { vcs_info }

PROMPT="%B[%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}%~]>> "
RPROMPT="%F{yellow}\$vcs_info_msg_0_%f"

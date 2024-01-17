# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Export
export TERM=xterm-256color
export CLICOLOR=1
export HISTCONTROL=ignoreboth
export LANG=en_GB.UTF.8
export PATH
export MYNAME
export EDITOR=vim
export VISUAL=vim

# set a fancy prompt (non-colour, unless we know we "want" colour)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a coloured prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have colour support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429).
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Set Manpager
export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# Prompt
# This is commented out if using starship prompt
PS1='[\u@\h \W]\$ '

# Path
if [ -d "$HOME/.bin" ] ; then 
	PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then 
	PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ; then 
	PATH="$HOME/Applications:$PATH"
fi

# Change Title of Terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
	;;
  screen*)
	PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
	;;
esac

# Shopt
shopt -s autocd         # change to named directory
shopt -s cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s dotglob        # include files beginning with a '.' 
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize   # checks term size when bash regains control

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Archive Extraction
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
	case $1 in
		*.tar.bz2)   tar xjf $1   ;;
	  *.tar.gz)    tar xzf $1   ;;
	  *.bz2)       bunzip2 $1   ;;
	  *.rar)       unrar x $1   ;;
	  *.gz)        gunzip $1    ;;
	  *.tar)       tar xf $1    ;;
	  *.tbz2)      tar xjf $1   ;;
	  *.tgz)       tar xzf $1   ;;
	  *.zip)       unzip $1     ;;
	  *.Z)         uncompress $1;;
	  *.7z)        7z x $1      ;;
	  *.deb)       ar x $1      ;;
	  *.tar.xz)    tar xf $1    ;;
	  *.tar.zst)   unzstd $1    ;;
	  *)           echo "'$1' cannot be extracted via ex()" ;;
	esac
  else
	echo "'$1' is not a valid file"
  fi
}

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

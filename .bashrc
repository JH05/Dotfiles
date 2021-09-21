#
# ~/.bashrc
#

### EXPORT
export TERM=xterm-256color
export CLICOLOR=1
export HISTCONTROL=ignoreboth
export LANG=en_GB.UTF.8
export PATH
export MYNAME
export EDITOR=vim
export VISUAL=vim

### SET MANPAGER
### "vim" as manpager
export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

### PROMPT
# This is commented out if using starship prompt
PS1='[\u@\h \W]\$ '

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

### SHOPT
shopt -s autocd         # change to named directory
shopt -s cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s dotglob        # 
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize   # checks term size when bash regains control

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### ARCHIVE EXTRACTION
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

### ALIASES ###

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Chaning "pb" to "xsel"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# pacman and yay
alias pacman-update='sudo pacman -Syyu'          # update only standard pkgs
alias aur-update='yay -Sua --noconfirm'          # update only AUR pkgs (yay)
alias system-update='yay -Syu --noconfirm'       # update standard pkgs and AUR pkgs (yay)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colourise grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Config files
alias mpd-config='vim $HOME/.config/mpd/mpd.conf'
alias ncm-config='vim $HOME/.config/ncmpcpp/config'
alias ala-config='vim $HOME/.config/alacritty/alacritty.yml'
alias fish-config='vim $HOME/.config/fish/config.fish'

# Other
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

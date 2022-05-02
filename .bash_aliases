#
# ~/.bash_aliases
#

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

# Colour grep output (good for log files)
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

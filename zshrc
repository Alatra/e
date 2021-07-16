# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Settings
export EDITOR=/usr/bin/nvim
export LANG=en_US.UTF-8


#add doom path
export PATH="$HOME/.emacs.d/bin:$PATH"
xset -b #remve the bip

#History
HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTORY_IGNORE='(ls|cd|pwd|exit|sz|ga|reboot|shutdown now|history|cd -|cd ..)'
setopt SHARE_HISTORY

#History search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^[k" history-beginning-search-backward-end
bindkey "^[j" history-beginning-search-forward-end

#Avoid imbriqued nvim
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim='echo "NO NO NO"'
fi

#Alias
#Setting
alias ster="$EDITOR ~/.Xresources && xrdb ~/.Xresources"
alias sz="$EDITOR ~/.config/zsh/zshrc && source ~/.config/zsh/zshrc"
alias sx="$EDITOR ~/.xmonad/xmonad.hs"

#Git 
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push $1 origin"
alias gac="git add . && git commit -m"
gacp(){
    git add . 
    git commit -a -m $1
    git push
}

#add screen + change sond
alias dual="xrandr --output HDMI1 --auto --right-of eDP1 && xmonad --restart"
alias ones="xrandr --setmonitor all auto eDP1,HDMI1 && xmonad --restart"
alias multis="xrandr --delmonitor all && xmonad --restart"

#set the screen to take out the sound
alias audion="pactl set-card-profile 0 output:analog-stereo"
alias audioh="pactl set-card-profile 0 output:hdmi-stereo"

#wifi interface
alias wifis="nmcli device wifi list"
alias wific="nmcli device wifi connect"
alias wifion="nmcli radio wifi on"
alias wifioff="nmcli radio wifi off"

#ls
alias ls="ls --color=auto"

#history
alias hist="history 0"

#Pacman
alias spu="sudo pacman -Syyuu"
alias spi="sudo pacman -S"
alias spr="sudo pacman -Rcns"


#Plugins

#Highligh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Extraxt
source ~/.config/zsh/plugins/zsh-extract/extract.plugin.zsh

#Vi mode
source ~/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

#Theme
source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/themes/p10k.zsh

#Completion
autoload -U compinit && compinit
kitty + complete setup zsh | source /dev/stdin
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

alias luamake=/home/waza/.config/nvim/lsp/lua-language-server/3rd/luamake/luamake

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Settings
export EDITOR=/usr/bin/nvim
export LANG=en_US.UTF-8
xset -b #remve the bip

#History
HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=10000
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

#Git 
alias ga="git add ."
alias gs="git status"
alias gc="git commit -m"
alias gp="git push $1 origin"

#ls
alias ls="ls --color=auto"

#Pacman
alias spu="sudo pacman -Syyuu"
alias spi="sudo pacman -S"


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

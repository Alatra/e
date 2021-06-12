# Settings
export EDITOR=/usr/bin/nvim
export LANG=en_US.UTF-8
xset -b #remve the bip

#History
HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY


#Avoid imbriqued nvim
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim='echo "NO NO NO"'
fi

#Setting
alias ster="$EDITOR ~/.Xresources && xrdb ~/.Xresources"
alias sz="$EDITOR ~/.zshrc && source ~/.zshrc"

#Git 
alias ga="git add ."
alias gs="git status"
alias gc="git commit -m"
alias gp="git push $1 origin"

#ls
alias ls="ls --color=auto"

#Highligh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Extraxt
source ~/.config/zsh/plugins/zsh-extract/extract.plugin.zsh

#Theme
source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

#Completion
autoload -U compinit && compinit
kitty + complete setup zsh | source /dev/stdin

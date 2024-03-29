if [ -z "$TMUX" ]
then
	tmux new-session -A -s main	
fi

[[ -r ~/.repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.repos/znap

source ~/.repos/znap/znap.zsh

# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source Aloxaf/fzf-tab

autoload -U compinit && compinit
zstyle ':completion:*' menu select

# NeoVim aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# Neovide aliases
alias nv="neovide"

# Exa aliases
alias ls="exa"
alias ll="exa -l"

export EDITOR="nvim"

# bun
export BUN_INSTALL="$HOME/.bun"
export GOBIN="$HOME/go/bin"
export PATH="$PATH:$HOME/.foundry/bin:$HOME/.cargo/bin:$GOBIN:$BUN_INSTALL/bin"
export CC=gcc-12

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fnm env --use-on-cd)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"


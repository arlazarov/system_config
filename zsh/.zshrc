if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="/powerlevel10k/powerlevel10k"

ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="false"
DISABLE_LS_COLORS="false"
DISABLE_MAGIC_FUNCTIONS="false"
DISABLE_UNTRACKED_FILES_DIRTY="false"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"

# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
#
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13
#
# bindkey -v
# bindkey -v '^?' backward-delete-char

# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64"

plugins=(
	git
	zsh-autosuggestions
	web-search
	copypath
	copyfile
	copybuffer
	history
	JsonTools
	macos
	zsh-vi-mode
	z
	# fzf-zsh-plugin
	fzf
)
DISABLE_FZF_AUTO_COMPLETION="false"
DISABLE_FZF_KEY_BINDINGS="false"
bindkey -s '^f' "fd --type d . --hidden | fzf --preview 'tree -C {} | head -50'^M"


source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export EDITOR=nvim
export VISUAL="$EDITOR"
export PATH=$PATH:~/himalaya/target/release/
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"

# cd up to n dirs, using:  cd.. 10   cd.. dir
function cd_up() {
  case $1 in
    *[!0-9]*)
      cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" )
      ;;
    *)
      cd $(printf "%0.0s../" $(seq 1 $1));
    ;;
  esac
}

alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias fzf-tmux="fzf-tmux --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias f='fd --type f --hidden --exclude .git | fzf | xargs nvim'
alias fs='fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim'
alias 'cd..'='cd_up'
alias 'mail'='himalaya'
alias 'hotspot'='bash <(curl -s http://192.168.49.1:8181/msh)'
alias 'mongo_start'='brew services start mongodb/brew/mongodb-community@5.0'
alias 'mongo_stop'='brew services stop mongodb/brew/mongodb-community@5.0'

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#(cat ~/.cache/wal/sequences &)

########## Aliases ##########

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='gls --color=always'     # GNU ls
    alias la='gls --color=always -a'  # GNU ls -a
    alias ll='gls --color=always -la' # GNU ls -la

elif [[ "$OSTYPE" == "linux"* ]]; then
    alias ls='ls --color=always'     # GNU ls
    alias la='ls --color=always -a'  # GNU ls -a
    alias ll='ls --color=always -la' # GNU ls -la
fi


alias pipes='pipes.sh'       # Pipes screensaver

alias clock='tty-clock -s'   # Terminal clock
alias timer='ttimer'         # Terminal timer

alias news='newsboat'        # Terminal RSS reader

alias virtenv='python3 -m venv ./venv'                                                                                     # Create virtual Python environment
alias virtact='source ./venv/bin/activate'                                                                                # Active virtual Python environment
alias pipupgradeall="sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U" # Update all pip packages
alias pytop='bpytop'                                                                                                       # Python system monitor

alias rm='trash' # Send to trash instead of deleting

alias ta='tmux attach -t'      # Tmux attach to session
alias tn='tmux new-session -s' # Tmux create session
alias tl='tmux list-sessions'  # Tmux list sessions

alias vtop='vtop -t nord' # Vtop system monitor

alias mutt='neomutt' # Terminal email client
alias please='sudo'  # For a nicer terminal experience

alias vim='nvim' # Open Neovim
alias vi='nvim'  # Open Neovim
alias v='nvim'   # Open Neovim

alias ping='prettyping' # Prettier ping
alias o='fuck'          # When you make a mistake

########## Completion ##########

bindkey '^[[A' up-line-or-search    # Search up through history
bindkey '^[[B' down-line-or-search  # Search down through history

zstyle ':completion:*' menu yes select                      # Tab menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Case insensitive matching

autoload -Uz compinit && compinit # Initialize completion
zmodload -i zsh/complist          # Initialize completion

export LSCOLORS='gxbxaxaxCxcxcxcxcxgxgx'                                               # ls command colors for BSD
export LS_COLORS='di=36:ln=31:so=30:pi=30:ex=1;32:bd=32:cd=32:su=32:sg=32:tw=36:ow=36' # ls command colors for Linux

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # ls colors for completion

########## Options ##########

setopt AUTO_CD              # If command can't be executed, and is name of directory, cd to that directory
setopt AUTO_PUSHD           # Go to previous directories with cd
setopt HIST_IGNORE_ALL_DUPS # Ignore duplicate commands
setopt HIST_REDUCE_BLANKS   # Remove blanks from commands
setopt PROMPT_SUBST         # Prompt substitution
setopt PUSHD_IGNORE_DUPS    # Ignore duplicates
setopt PUSHD_SILENT         # Silent pushing and popping
setopt SHARE_HISTORY        # Share history between sessions

export EDITOR='nvim'        # Set default editor
export BAT_THEME="TwoDark"  # Set bat theme
export TERM=xterm-256color  # Set term variable
export FPATH="/usr/local/share/zsh/functions:$FPATH"
export QT_QPA_PLATFORMTHEME=qt5ct

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/usr/local/opt/llvm/bin/lldb:$PATH"                # Debugger
    export PATH="/usr/local/sbin:$PATH"                             # Add sbin to path
    export PATH="/Applications/calibre.app/Contents/MacOS/:$PATH"   # Add Calibre command line tools to path
fi

export PATH="$HOME/.bin/:$PATH"   # Add user binaries and scripts to path

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Fuzzy finder

eval $(thefuck --alias) # Command correction
eval "$(rbenv init -)"  # Ruby environment

# Automatically start or connect to tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t General || tmux new -s General
fi

########## Prompt ##########

export PS1="%F{blue}%~%f %(?.%F{green}❯%f.%F{red}❯%f) " # Alternatives for prompt icon: ◯, •, ❯

########## ZLE ##########

autoload -U edit-command-line && zle -N edit-command-line # Load edit current command

zle -N fzf-history

bindkey '^@' edit-command-line  # Bind edit current command
bindkey "^[[1;3C" forward-word  # Bind forward one word
bindkey "^[[1;3D" backward-word # Bind backward one word
bindkey '^A' beginning-of-line  # Bind beginning of line
bindkey '^E' end-of-line        # Bind end of line
bindkey '^H' backward-kill-word # Bind delete word backwards
bindkey '^L' clear-screen       # Bind clear screen
bindkey '^U' backward-kill-line # Bind delete line

doas() {
    if ! /usr/bin/doas true; then
        fortune insults 1>&2; false
    else
        /usr/bin/doas "$@"
    fi
}

TERMINAL="kitty"

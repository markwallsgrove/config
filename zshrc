# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm aws fzf web-search kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# eval "$(scmpuff init -s)"

# vim mode
bindkey -v
bindkey "^R" history-incremental-search-backward
export KEYTIMEOUT=1


# fnm
# export PATH=/home/smokyb/.fnm:$PATH
# eval "`fnm env --multi`"

# brew
if [ -d "/home/linuxbrew/.linuxbrew/bin" ] ; then
    PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi


autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.`

# export PATH="$PATH:$HOME/.ec2.cli"
# if [ -f ~/.ec2.cli/completion.bash ]; then
# 	source ~/.ec2.cli/completion.bash
# fi

# export PATH="$PATH:$HOME/.pyenv/versions/3.7.2/bin"
# export PATH="$PATH:$HOME/.ebcli-virtual-env/executables"

# for https://gitlab.infosum.io/infrastructure/tooling/iss
export PATH="$PATH:$HOME/.local/bin"

# golang binaries
export PATH="$PATH:/usr/local/go/bin"
export GOPRIVATE=gitlab.infosum.io
export PATH="$PATH:$HOME/go/bin"

export PATH="$PATH:$HOME/projects/gitlab/infosum/tools/scripts/sre"

export PATH="$PATH:$HOME/bin"

# edit line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

setxkbmap -option "ctrl:nocaps"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.secrets ] && source ~/.secrets
[ -f ~/.exports ] && source ~/.exports
[ -f ~/.funcs ] && source ~/.funcs

export YKMAN_OATH_CREDENTIAL_NAME="Amazon"
export AWS_VAULT_PROMPT=ykman

export VISUAL="/usr/bin/nvim"
export EDITOR="$VISUAL"

# NoiseTorch
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

source ~/.kubech/kubech
source ~/.kubech/completion/kubech.bash

export GIT_WORKSPACE="$HOME/projects"


setopt no_aliases
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
setopt aliases

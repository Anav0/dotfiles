# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions bgnotify)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

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
# SET TMUX
export TERM="xterm-256color"
# if tmux is executable, X is running, and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
  [ -z "${TMUX}" ] && (tmux attach || tmux) >/dev/null 2>&1
fi

# Aliases
#alias ls="colorls --sd -A"

alias c="clear"
alias vim="nvim"
alias q="exit"
alias hd="hexdump -C"
alias pacrem="sudo pacman -Rcns"
alias yayupd="yay -Sy"
alias yayupg="yay -Syu"
alias pingoogle="ping 8.8.8.8"
alias trimall="sudo fstrim -va"
alias reflesh="sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist"
alias nanosu="sudo nano"
alias vimsu="sudo vim"
alias projects='cd $HOME/Projects'
alias vimrc='vim ~/.vimrc'
alias nvimrc='nvim ~/.nvimrc'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias mk='mkdir -pv'
alias nusmv='$HOME/programs/NuSMV-2.6.0-Linux/bin/NuSMV'
alias alacritty-config='vim $HOME/.config/alacritty.yml'
alias studia='cd $HOME/Documents/Studia'
alias e="exa"
alias E="exa -lh"
alias jn="~/.local/bin/jupyter-notebook"
alias tina="$HOME/programs/tina-3.6.0/bin/nd"
alias selt="$HOME/programs/tina-3.6.0/bin/selt"
alias r="ranger"
alias tmm="tmuxinator"
alias ask="$HOME/scripts/ask.sh"
alias mgr="ranger '$HOME/Documents/Studia/Praca magisterska/'"
alias scripts="cd $HOME/scripts/"
alias compile-latex="$HOME/scripts/compile-latex.sh"
alias update-bib="$HOME/scripts/update-bib.sh"
alias watch-latex="$HOME/scripts/watch-latex.sh"
alias search="$HOME/scripts/search.sh"

# Color toys aliases
alias bloks="~/.color-toys/bloks"
alias colortest="~/.color-toys/colortest"
alias colortest-slim="~/.color-toys/colortest-slim"
alias colorview="~/.color-toys/colorview"
alias colorbars="~/.color-toys/colorbars"
alias panes="~/.color-toys/panes"
alias pipes1="~/.color-toys/pipes1"
alias pipes2="~/.color-toys/pipes2"
alias pipes2-slim="~/.color-toys/pipes2-slim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
export PATH="$PATH:/opt/mssql-tools/bin"
fpath+=${ZDOTDIR:-~}/.zsh_functions

export IRACE_HOME="/home/igor/R/x86_64-pc-linux-gnu-library/4.0/irac"
export R_LIBS=${R_LIBS_USER}:${R_LIBS}

export PATH="$HOME/.local/bin:$PATH"
export PATH="${IRACE_HOME}/.local/bin:$PATH"
export EDITOR="vim"
alias config='/usr/bin/git --git-dir=/$HOME/.dotfiles/ --work-tree=$HOME'
alias calc="/usr/bin/sc-im"

# NNN editor enviroment variables
export NNN_BMS="d:$HOME/Downloads;j:~/source/Dysk/Jihad;s:~/Documents/Studia/;p:~/Projects"
export NNN_PLUG="f:finder;o:fzopen;d:diffs;v:imgview;i:preview-tui"
export NNN_FCOLORS=""
export NNN_USE_EDITOR=1
export NNN_FIFO=/tmp/nnn.fifo


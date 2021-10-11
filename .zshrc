# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions bgnotify)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

source $ZSH/oh-my-zsh.sh

# SET TMUX

# Aliases
alias c="clear"
alias vim="nvim"
alias q="exit"
alias nanosu="sudo nano"
alias vimsu="sudo vim"
alias projects='cd $HOME/Projects'
alias vimrc='$EDITOR ~/.vimrc'
alias nvimrc='$EDITOR ~/.nvimrc'
alias bashrc='$EDITOR ~/.bashrc'
alias zshrc='$EDITOR ~/.zshrc'
alias mk='mkdir -pv'
alias ac='$EDITOR $HOME/.config/alacritty.yml'
alias studia='cd $HOME/Documents/Studia'
alias e="exa"
alias E="exa -lh"
alias jn="~/.local/bin/jupyter-notebook"
alias r="ranger"
alias tmm="tmuxinator"
alias ask="$HOME/scripts/ask.sh"
alias mgr="ranger '$HOME/Documents/Studia/Praca magisterska/'"
alias scripts="cd $HOME/scripts/"
alias compile-latex="$HOME/scripts/compile-latex.sh"
alias update-bib="$HOME/scripts/update-bib.sh"
alias watch-latex="$HOME/scripts/watch-latex.sh"
alias search="$HOME/scripts/search.sh"
alias bloks="~/.color-toys/bloks"
alias colortest="~/.color-toys/colortest"
alias colortest-slim="~/.color-toys/colortest-slim"
alias colorview="~/.color-toys/colorview"
alias colorbars="~/.color-toys/colorbars"
alias panes="~/.color-toys/panes"
alias pipes1="~/.color-toys/pipes1"
alias pipes2="~/.color-toys/pipes2"
alias pipes2-slim="~/.color-toys/pipes2-slim"
alias config='/usr/bin/git --git-dir=/$HOME/.dotfiles/ --work-tree=$HOME'
alias calc="/usr/bin/sc-im"
alias xc="$EDITOR $HOME/.xmonad/xmonad.hs"

export TERM="xterm-256color"
# if tmux is executable, X is running, and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
  [ -z "${TMUX}" ] && (tmux attach || tmux) >/dev/null 2>&1
fi

fpath+=${ZDOTDIR:-~}/.zsh_functions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
export NNN_BMS="d:$HOME/Downloads;j:~/source/Dysk/Jihad;s:~/Documents/Studia/;p:~/Projects"
export NNN_PLUG="f:finder;o:fzopen;d:diffs;v:imgview;i:preview-tui"
export NNN_FCOLORS=""
export NNN_USE_EDITOR=1
export NNN_FIFO=/tmp/nnn.fifo
export BROWSER="brave-browser"
export IRACE_HOME="$HOME/R/x86_64-pc-linux-gnu-library/4.0/irac"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$IRACE_HOME/.local/bin:$PATH"
export PATH="$HOME/.config/rofi/bin:$PATH"
export IRACE_HOME="/home/igor/R/x86_64-pc-linux-gnu-library/4.0/irac"
export R_LIBS=${R_LIBS_USER}:${R_LIBS}
export EDITOR="vim"

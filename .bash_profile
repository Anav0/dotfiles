# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
source "$HOME/.cargo/env"

export PATH="$PATH:$HOME/scripts"

# NNN editor enviroment variables
export NNN_BMS="d:$HOME/Downloads;j:~/source/Dysk/Jihad;s:~/Documents/Studia/;p:~/Projects"
export NNN_PLUG="f:finder;o:fzopen;d:diffs;v:imgview;i:preview-tui"
export NNN_FCOLORS=""
export NNN_USE_EDITOR=1
export NNN_FIFO=/tmp/nnn.fifo

imwheel
systemctl --user restart pulseaudio.service

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd


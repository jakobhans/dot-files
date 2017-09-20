# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
export GOPATH=$HOME/.gopath
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:$HOME/.npm-global/bin:$HOME/.config/composer/vendor/bin:$PATH
export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export VISUAL='vim'
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Own stuff
#Aliases
alias ctagslaravel='ctags -R --exclude=node_modules --exclude=vendor'
alias ls='pwd; ls -a --color'
alias lsl='pwd; ls -la --color | more'
alias g='git'
alias startx='ssh-agent startx'
alias ht='htop --sort-key=PERCENT_CPU'
alias xr1='xrandr --output DP-0 --auto --output HDMI-0 --off --output DP-1 --off --output DP-2 --off & ~/.config/polybar/launch.sh'
alias xr2dp2='xrandr --output HDMI-0 --auto --output DP-2 --auto --left-of HDMI-0 --output DP-0 --off & ~/.config/polybar/launch.sh'
alias xr2dp0='xrandr --output HDMI-0 --auto --output DP-0 --auto --left-of HDMI-0 --output DP-2 --off & ~/.config/polybar/launch.sh'
alias xr3='xrandr --output DP-0 --auto --output HDMI-0 --auto --left-of DP-0 --output DP-2 --auto --left-of HDMI-0 & ~/.config/polybar/launch.sh'

#SSH Tunneling function
sshtunnelmysql () {
    ssh $1 -L $2:127.0.0.1:$2 -N;
}
#Description after some actions
for c in cp rm chmod chown rename; do
    alias $c="pwd; $c -v"
done

# Completion stuff
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' verbose yes

# Automatically start x session and then logout when done
if [ "$(tty)" = "/dev/tty1" ]; then
    startx && exit
fi

setopt NO_CASE_GLOB

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=$PATH:$HOME/.local/bin

alias zshconfig='vi ~/.zshrc'
alias ls='pwd; ls -lahG --color | more'
alias vi='vim'
alias g='git'

for c in cp rm chmod chown rename; do
    alias $c="$c -v"
done

# Completion stuff
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

zstyle ':completion:*' auto-description 'specify: %d'

# Adding powerline support
. /home/jakobhans/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

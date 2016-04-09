setopt AUTO_CD
setopt CORRECT
setopt AUTO_PUSHD
setopt AUTO_NAME_DIRS
setopt PUSHD_TO_HOME
setopt RM_STAR_WAIT
setopt ZLE
setopt VI

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=$PATH:$HOME/.local/bin

declare -U path

alias zshconfig='vi ~/.zshrc'
alias ls='pwd; ls -lahG --color=auto'
alias vi='vim'
alias g='git'

for c in cp rm chmod chown rename; do
    alias $c="$c -v"
done

# Adding powerline support
. /home/jakobhans/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

export PATH="$PATH:$HOME/scripts:/opt/idea-IC-201.7223.91/bin:/usr/local/go/bin"
export NODE_OPTIONS="--experimental-repl-await"
export ZSH="/home/michal/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias ll='ls -lah'
alias ipy="ipython"
alias py="source pyutil"
alias wireshark="xhost local:root; sudo wireshark &> /dev/null"
alias burp="/usr/lib/jvm/adoptopenjdk-11-hotspot-amd64/bin/java -jar /opt/burpsuite_community_v2020.4.jar &> /dev/null &"
alias ida64="/opt/idafree-7.0/ida64"

compdef -d java

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
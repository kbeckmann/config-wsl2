export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Persistent SSH agent
authpath=$HOME/.ssh-auth-sock
if [ -e $authpath ] && [ -e $(cat $authpath) ] ; then
	export SSH_AUTH_SOCK=$(cat $authpath)
else
	eval $(ssh-agent)
	ssh-add
	echo $SSH_AUTH_SOCK >| $authpath
fi

alias vim=nvim
alias nv=nvim

export EDITOR=nvim

export PICO_SDK_PATH=~/code/pico-sdk

export PATH=~/bin:$PATH
export PATH=~/zig/zig-linux-x86_64-0.13.0-dev.75+5c9eb4081:$PATH
export PATH=~/code/zls/zig-out/bin:$PATH
export PATH=~/oss-cad-suite/bin:$PATH


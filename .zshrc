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

export EDITOR=nvim

export PATH=~/bin:~/zig/zig-linux-x86_64-0.13.0-dev.75+5c9eb4081:$PATH
export PATH=~/code/zls/zig-out/bin:$PATH


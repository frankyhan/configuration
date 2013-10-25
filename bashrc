# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

set -o vi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto -h'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lFh'
alias la='ls -Ah'
alias l='ls -CFh'
alias hla='hla -lmelf_i386'

alias gtst='git status'
alias gtrm='git rm'
alias gtci='git commit'
alias gtct='git checkout'
alias gtad='git add'
alias gtdf='git diff'
alias gtps='git push'
alias gtpl='git pull'
alias gtcl='git clone'
alias gtlg='git log'
alias gtgp='git grep'
alias gtbr='git branch'
alias gtit='git init'
alias gtmg='git merge'
alias gtmv='git mv'
alias gttg='git tag'
alias gtrt='git reset'
alias gtft='git fetch'
alias ta='tmux attach -t'
alias tn='tmux new -s'

alias hls='hadoop fs -ls'
alias hcp='hadoop fs -cp'
alias hmv='hadoop fs -mv'
alias hrm='hadoop fs -rm'
alias hrmr='hadoop fs -rmr'
alias hcfl='hadoop fs -copyFromLocal'
alias hmfl='hadoop fs -moveFromLocal'
alias hctl='hadoop fs -copyToLocal'
alias hmtl='hadoop fs -moveToocal'
alias hmkdir='hadoop fs -mkdir'
alias htail='hadoop fs -tail'
alias hcat='hadoop fs -cat'
alias hget='hadoop fs -get'
alias hput='hadoop fs -put'
alias hdu='hadoop fs -du'
alias hkill='hadoop job -kill'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi


PATH="$HOME/:$JAVA_HOME/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"

PATH="$PATH:/home/service/httpd/bin"
PATH="$PATH:/home/search/coreseek/bin/"
PATH="/home/work/third/bin/:$PATH"
PATH="/home/service/third/bin/:$PATH"

echo "this is bashrc"
unset SSH_ASKPASS

# User specific aliases and functions
export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre
export HADOOP_HOME=/home/hadoop/hadoop/hadoop-1.0.1
#export HADOOP_PREFIX=/home/hadoop/hadoop/hadoop-1.0.1
#export HADOOP_HOME=/home/hadoop/hadoop-0.23.8
#export HADOOP_HOME=/usr/local/hadoop-0.20.2-cdh3u6
export PATH=$HADOOP_HOME/bin:$PATH
export PIG_HOME=/home/hadoop/hadoop/pig-0.10.0
export PATH=$PATH:$PIG_HOME/bin
export HIVE_HOME=/home/hadoop/hadoop/hive-0.8.1
export PATH=$PATH:$HIVE_HOME/bin:/usr/local/bin
export HADOOP_HOME_WARN_SUPPRESS="TRUE"
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:`$HADOOP_HOME/bin/hadoop classpath`



export LD_LIBRARY_PATH=/home/service/boost/lib:/home/service/thrift/lib:/home/service/libevent/lib:/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre/lib/amd64/server:/home/hadoop/hadoop-0.23.8-src/hadoop-hdfs-project/hadoop-hdfs/target/native/target/usr/local/lib:/home/service/third/lib/mysql
#export LD_LIBRARY_PATH=/home/service/boost/lib:/home/service/thrift/lib:/home/service/libevent/lib:/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre/lib/amd64/server:/home/service/libevent/lib:/home/hadoop/hadoop-0.22.0/c++/Linux-amd64-64/lib
#export LD_LIBRARY_PATH=/home/service/boost/lib:/home/service/thrift/lib:/home/service/libevent/lib:/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre/lib/amd64/server:/home/service/libevent/lib:/usr/local/hadoop-0.20.2-cdh3u6/c++/Linux-amd64-64/lib

#export CLASSPATH=/usr/local/cdh/hadoop/conf:/usr/local/cdh/hadoop/hadoop-core-0.20.2-cdh3u2.jar:/usr/local/cdh/hadoop/lib/commons-logging-1.0.4.jar


# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.65-2.b17.el7_1.x86_64
export PATH=$PATH:$JAVA_HOME/bin
export HOST=`hostname`
export PS1='
${USER}@${HOST}
${PWD}>'
backup_function() {
    #function that will backup a file to the same name plus the date plus backup
    cp $1{,.`date +"%Y%m%d"`_`date +"%T"`.backup}
}
docker_container_cleanup(){
    #this will stop and remove all containers, including running and nonrunning
    docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}
alias backup=backup_function
alias docleanup=docker_container_cleanup
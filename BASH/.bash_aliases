#!/bin/bash -noexec
# To add the “no execution” option to a shell directive, you can use the -n or --noexec option.
# This will cause Bash to check the syntax of the script without actually executing it.

##LIST FILES##
alias ll='ls -laht'
alias l='ls -aC'

##Check free space on disks##
alias df='df -h'

##Safe operations with files##
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

##Fast upwards navigation (comes with ZSH)##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

# Fast home navigation
alias cdhr='cd /home/vagrant/repo'
alias cdhrv='cd /home/vagrant/repo/vagrant-dev'

#Kube aliases
alias k='kubectl'
alias wk='watch kubectl '
alias ktx='kubectx'
alias kns='kubense'
alias kon='kubeon'
alias koff='kubeoff'
complete -o default -F __start_kubectl k


## Docker aliases
alias dr='docker run -dit '
alias de='docker exec -it'
alias db='docker build'
alias dbt='docker build -t test'


##GITHUB##
alias gbc='git checkout -b '
alias gco='git checkout '
alias gs='git status'
alias gc='git commit -m '
alias ga='git add *'
alias gp='git push'

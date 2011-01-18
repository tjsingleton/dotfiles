cd()
{
   if [ -z "$1" ] ; then
       command cd
   else
       if [ -n "$2" ]; then
           TRY="${PWD/$1/$2}"
       else
           TRY="$1"
       fi

       if [ -f "${TRY}" ]; then
           command cd "${TRY:h}"
       else
           command cd "${TRY}"
       fi
   fi
   ls -F -G
}

alias ls="ls -h"
alias ll="ls -lhs -G"
alias la="ls -lha -G"

alias cls='clear; ls'

alias curljson='curl -H "Accept: application/json"'
alias e='exit'

# funeral futurist
alias carbon_dig="dig @ns1.funeralfuturist.net "

# git
alias gpull="git stash && git pull --rebase && git stash pop"
alias gpush="gpull && git push"
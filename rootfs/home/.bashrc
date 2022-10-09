. /etc/fos/config/fos_shell_settings

# Colors
RCol='\[\e[0m\]'
Red='\[\e[0;31m\]'
Gre='\[\e[0;32m\]'
BYel='\[\e[1;33m\]'
BBlu='\[\e[1;34m\]'
Pur='\[\e[0;35m\]'

set_prompt_symbol() {
    SYMBOL="${Gre}->"
    [ $? != 0 ] && SYMBOL="${Red}->"
}


set_git_branch() {
    GIT=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
    [ -n $GIT ] && GIT="${Gre}"${GIT}
}

set_virtualenv() {
    PYENV=$VIRTUAL_ENV
    [ -z $PYENV ] && return

    local name=$(basename $PYENV)
    local version=$(python --version | awk '{print $2 }')
    PYENV=" ${Pur}using ${name} [${version}]"
}

__set_prompt() {
    set_prompt_symbol
    set_virtualenv
    set_git_branch


    PS1="\n${BBlu}\w${PYENV}${GIT}\n${SYMBOL} ${RCol}"
}

PROMPT_COMMAND=__set_prompt

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

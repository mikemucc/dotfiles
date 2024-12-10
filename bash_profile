# if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
export BASH_SILENCE_DEPRECATION_WARNING=1
export OPENAI_API_KEY=
export HISTCONTROL=ignoreboth:erasedups

#Import my Aliases
source ${HOME}/.aliases

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export TERM="xterm-color" 
# export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

source ~/.bash/git-completion.bash # Git Completion
source ~/.bash/git-prompt.sh # Show git branch name at command prompt
# export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export GIT_PS1_SHOWCOLORHINTS=true # Option for git-prompt.sh to show branch name in color
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

# Terminal Prompt:
# Include git branch, use PROMPT_COMMAND (not PS1) to get color output (see git-prompt.sh for more)
# export PROMPT_COMMAND='__git_ps1 "\w" "\n\\\$ "' # Git branch (relies on git-prompt.sh)
# export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
export PROMPT_COMMAND='__git_ps1 "\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;36m\]\w" "\n\[\e[0m\]\\\$ "'
export PATH="$HOME/go/bin:$PATH"

# eval "$(starship init bash)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

eval $(thefuck --alias)
eval $(thefuck --alias f)

export AWS_PROFILE=sdc-sandbox:CloudPlatformEngineer-Dev
export AWS_REGION=us-east-2

export DOCKER_BUILDKIT=1

eval "$(direnv hook bash)"

export ARTIFACTORY_USER="$(whoami)@smiledirectclub.com"
# export ARTIFACTORY_PASSWORD="$(security find-generic-password -s 'artifactory' -w)"

#Poetry in path
# export PATH="/Users/michael.mucciarone/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/michael.mucciarone/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
complete -C /usr/local/bin/boundary boundary

export BOUNDARY_ADDR=https://boundary.smileco.cloud/
export BOUNDARY_AUTH_METHOD_ID=amoidc_xw0P8cop3a
# pyenv
export PYENV_ROOT="/Users/michael.mucciarone/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# nodenv
export NODENV_ROOT="/Users/michael.mucciarone/.nodenv"
export PATH=$NODENV_ROOT/shims:$NODENV_ROOT/bin:$PATH
source "/Users/michael.mucciarone/.nodenv/completions/nodenv.bash"

## Github
export GITHUB_TOKEN=$(security find-internet-password -s 'github.com' -w)

# something important perhaps
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# starship
eval "$(starship init zsh)"
. "$HOME/.local/bin/env"

# zoxide
eval "$(zoxide init zsh)"

# plugins
source ~/.zsh-plugins/git.plugin.zsh
SHOW_AWS_PROMPT=false && source ~/.zsh-plugins/aws.plugin.zsh

# aliases
alias l="eza --icons --group-directories-first -lah"
alias ll="eza --icons --group-directories-first -lah"
alias cat="bat"
alias cd="z"

alias python="python3"
alias pip="uv pip"
alias uvi="uv pip install -U"

alias gb="git brunch"
alias gn="git checkout -b"
alias ga="git add ."
alias gc="git commit -S -m"
alias gpl="git pull"

alias config="cursor ~/.zshrc"
alias dockerwipe='docker kill $(docker ps -aq) && docker rm $(docker ps -aq) ; docker rmi $(docker images -q) ; docker system prune -af'


# commands
gpp() {
    git push --set-upstream origin $(git branch --show-current)
}
gprk() {
    git push --set-upstream origin $(git branch --show-current) \
    && gh pr create --fill -r KonvuTeam/engineers --head $(git branch --show-current) \
    | grep -o 'https://github.com/[^/]*/[^/]*/pull/[0-9]*' \
    | xargs open
}
ksp() {
    if [ -z "$1" ]; then
        unset KUBECONTEXT && kubectx -u > /dev/null 2>&1 && echo "Kube context cleared."
    else
        export KUBECONTEXT="$1" && kubectx "$1" > /dev/null 2>&1
    fi
}
xsp() {
    asp "$1" && ksp "$1"
}

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# go path
export PATH="$PATH:$(go env GOPATH)/bin"

# java path
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# remove docker compose interactive issue
export COMPOSE_MENU=0

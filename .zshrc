export AWS_PROFILE=tgnhrkn-dev-profile
export GITHUB_PAT=<FILL IN GH PAT>

mergemain() {
    CUR_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [[ $CUR_BRANCH == 'main' ]]; then
        echo "already on main"
        return
    fi

    git checkout main
    git pull
    git checkout $CUR_BRANCH
    git merge main
}

git_doit() {
    git add .
    git commit -m "$1"
    git push
}
alias gd=git_doit

git_main() {
    git checkout main
    git pull
    clear
    git status
}
alias gm=git_main

alias gc='git checkout'

git_checkout() {
    git checkout -b teagan/$1
}
alias gcb=git_checkout

alias ghpr='gh pr create -w'

chpwd() {
  if test -f .nvmrc; then
    nvm use
  fi
}

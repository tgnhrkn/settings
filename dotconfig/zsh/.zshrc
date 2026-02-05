export NEW_DEVTOOLS=true
export LLM_AUTO_FORMATTING=false

alias dev=$HOME/code/cargadoinc/start-dev.sh
alias chrome=$HOME/code/cargadoinc/start-chrome.sh
alias y=yarn
alias zshrc=vim $HOME/.config/zsh/.zshrc

call_pr_poster() {
    $HOME/code/cargadoinc/toolbox/node_modules/.bin/tsx $HOME/code/cargadoinc/toolbox/src/prPoster/cli.ts $@
}
alias prposter=call_pr_poster

git_commit_push() {
    git add .
    git commit -m "${1:-pushing}"
    git push
}
alias gcp=git_commit_push

alias gt='git town'
alias gtx='gt switch ^teagan/ ^main -tf+m'
alias gts='gt sync'
alias gtss='gt sync --stack'
alias gtsa='gt sync --all'
alias gta='gt append'
alias gtpr='gt propose'

chpwd() {
  if test -f .nvmrc; then
    nvm use
  fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


function prompt_command {
    RET=$?
    export PS1=$(~/.zsh_prompt_command $RET)
}
PROMPT_COMMAND=prompt_command

precmd() { eval "$PROMPT_COMMAND" }

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

chpwd
export PATH="$HOME/.local/bin:$PATH"

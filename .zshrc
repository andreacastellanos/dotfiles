# =============================
#           GENERAL
# =============================

if [ -f ~/.git-completion.zsh ]; then
  . ~/.git-completion.zsh
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

setopt prompt_subst
autoload -U colors && colors

function git_branch() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

PROMPT='%F{black}%D{%I:%M %p}%f - %F{black}%n%f: %F{blue}%~%f'$'\n''└─ %F{cyan}$(git_branch)%f >>> '

# =============================
#           VIM
# =============================

alias vim="nvim"
alias vi="nvim"
alias vidir="cd ~/.config/nvim/"
export VISUAL=vim;
export EDITOR=vim;

# =============================
#      GENERAL COMMANDS
# =============================

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias ls="ls -AF"
alias ..="cd .."
alias ...="cd ../.."

alias rc="vim ~/.zshrc"
alias src="source ~/.zshrc"

# =============================
#        GIT COMMANDS
# =============================

alias del="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"
alias grm="git branch | grep -v "master" | xargs git branch -D"

alias gm="git checkout master"
alias gbs="git checkout $1"
alias gp="git push"
alias gu="git pull"
alias gaa="git add ."
alias ga="git add $1"
alias gd="git diff"
alias gds="git diff --staged"
alias gr="git reset --hard HEAD~1"
alias grs="git checkout master -- $1"
alias noop="git commit --allow-empty -m 'no op' && git push"

function gh {
  open -a "/Applications/Google Chrome.app" "https://github.com/andreacastellanos/$(basename `git rev-parse --show-toplevel`)/compare/master...$(git branch | grep \* | cut -d ' ' -f2)"
}

function gb {
  if [ "$#" -eq 0 ]; then
    echo "provide description"
  else
    initials=ac
    IFS=-
    branch_name=$(printf %s\\n "$*")
    git checkout -b "${initials}-${branch_name}"
  fi
}

function gc () {
  IFS=" "
  git commit -m "$*"
}

function gls () {
  echo '--- files ---' &&
  git status --short &&
  printf "\n"
  echo '--- staged ---' &&
  git diff --staged --name-only
  printf "\n"
}


alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'


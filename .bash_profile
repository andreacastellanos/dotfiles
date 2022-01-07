# =============================
#           GENERAL
# =============================

export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PS1="\t - \u: \w \n└─ ( \$(git branch 2>/dev/null | grep '^*' | colrm 1 2) ) >>> "

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

alias bp="vim ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias brc="vim ~/.bashrc"
alias sbrc="source ~/.bashrc"

# =============================
#        GIT COMMANDS
# =============================

alias del="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"
alias grm="git branch | grep -v "master" | xargs git branch -D"
alias gm="git checkout master"
alias gr="git reset --hard HEAD~1"
alias gps="git push"
alias gpl="git pull"
alias ga="git add ."
alias gbs="git checkout $1"
alias gd="git diff"
alias noop="git commit --allow-empty -m 'no op' && git push"

function gh {
  open -a "/Applications/Google Chrome.app" "https://github.com/repo/$(basename `git rev-parse --show-toplevel`)/compare/master...$(git branch | grep \* | cut -d ' ' -f2)"
}

function gb {
  if [ "$#" -eq 0 ]; then
    echo "provide ticket and description"
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

function gcp {
  gc && gp
}

function gph {
  gp && gh
}

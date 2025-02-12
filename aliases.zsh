# Shortcuts
alias reloadshell="omz reload"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

# Directories
alias dotfiles="cd $DOTFILES"
alias dev="cd $HOME/Dev"

# Laravel
alias a="herd php artisan"
alias fresh="herd php artisan migrate:fresh --seed"
alias tinker="herd php artisan tinker"
alias seed="herd php artisan db:seed"
alias serve="herd php artisan serve"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="herd composer"
alias php="herd php"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run dev"

# Git
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force-with-lease"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias prune="git fetch --prune"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"

# PHP
alias php="herd php"
alias phpunit="vendor/bin/phpunit"
alias phpunitw="phpunit-watcher watch"
alias a="php artisan"
alias ar="php artisan remote"
alias composer="herd composer"
alias c="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"
alias hostfile="sudo vi /etc/hosts"
alias deploy='envoy run deploy'
alias deploy-code='envoy run deploy-code'
alias mfs='php artisan migrate:fresh --seed'
alias nah='git reset --hard;git clean -df'

alias pp="php artisan test --parallel"
alias d="php artisan dusk"
alias sshconfig="vi ~/.ssh/config"
alias copykey='command cat ~/.ssh/id_ed25519.pub | pbcopy'

# Git
alias gc="git checkout"
alias gpo="git push origin"
alias gm="git merge"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Fast open
alias o="open ."

# List all files colorized in long format
alias l="ls -laF"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# IP addresses
alias ip="curl ifconfig.me/ip ; echo"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Lock the screen
alias afk="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Scape webpage
alias scrape="scrapeUrl"

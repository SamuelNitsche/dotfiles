# Run tests
function p() {
   if [ -f vendor/bin/pest ]; then
      vendor/bin/pest "$@"
   else
      vendor/bin/phpunit "$@"
   fi
}

function pf() {
   if [ -f vendor/bin/pest ]; then
      vendor/bin/pest --filter "$@"
   else
      vendor/bin/phpunit --filter "$@"
   fi
}

# Create a new directory and enter it
function mkd() {
   mkdir -p "$@" && cd "$@"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-9000}"
	sleep 2 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
	local port="${1:-4000}"
	local ip=$(ipconfig getifaddr en0)
	sleep 2 && open "http://${ip}:${port}/" &
	php -S "${ip}:${port}"
}

# All the dig info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer
}

function tinker()
{
  if [ -z "$1" ]
    then
       php artisan tinker
    else
       php artisan tinker --execute="dd($1);"
  fi
}

archive () {
   zip -r "$1".zip -i "$1" ;
}

function removehost() {
   ssh-keygen -R "$1"
}

function weather() {
   local city="${1:-Antwerp}"
   curl http://wttr.in/${city// /+}\?F
}

# Scrape a single webpage with all assets
function scrapeUrl() {
    wget --adjust-extension --convert-links --page-requisites --span-hosts --no-host-directories "$1"
}

#  Commit everything
function commit() {
  commitMessage="$*"

  if [ "$commitMessage" = "" ]; then
     commitMessage="wip"
  fi

  git add .
  eval "git commit -a -m '${commitMessage}'"
}

function db {
    if [ "$1" = "refresh" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    elif [ "$1" = "list" ]; then
        mysql -uroot -e "show databases" | perl -p -e's/\|| *//g'
    fi
}

function opendb () {
   [ ! -f .env ] && { echo "No .env file found."; exit 1; }

   DB_CONNECTION=$(grep DB_CONNECTION .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_HOST=$(grep DB_HOST .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_PORT=$(grep DB_PORT .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_DATABASE=$(grep DB_DATABASE .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_USERNAME=$(grep DB_USERNAME .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)
   DB_PASSWORD=$(grep DB_PASSWORD .env | grep -v -e '^\s*#' | cut -d '=' -f 2-)

   DB_URL="${DB_CONNECTION}://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}"

   echo "Opening ${DB_URL}"
   open $DB_URL
}

function scheduler () {
    while :; do
        php artisan schedule:run
	echo "Sleeping 60 seconds..."
        sleep 60
    done
}

function silent() {
   "$@" >& /dev/null
}

# Functions
function spacetonewline () {
    perl -pe 's/ /\n/g' "$1" >> "$2";
    rm -f "$1";
}

function rmd () {
    pandoc $1 | lynx -stdin
}

function mkcd ()
{
    mkdir -p "$@" && cd "$@";
}

function rmextension ()
{
    find . -name "*.$@" -type f -delete;
}

function up ()
{
  cd $(printf "%0.s../" $(seq 1 $1 ));
}

function myip ()
{
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
    ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

function mkvirtualenvpy3 ()
{
    python3 -m venv .
    source bin/activate
}


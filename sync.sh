# ./sync.sh
# -f > force sync
# -d host:/home > destination, if not specified it's ~

args=`getopt fd: $*`
# you should not use `getopt abo: "$@"` since that would parse
# the arguments differently from what the set command below does.
if [ $? != 0 ]
then
       echo 'Usage: ...'
       exit 2
fi
set -- $args

force=0
dest=$HOME
# You cannot use the set command with a backquoted getopt directly,
# since the exit code from getopt would be shadowed by those of set,
# which is zero by definition.

for i
do
       case "$i"
       in
               -f)
                       force=1;
                       shift;;
               -d)
                       dest="$2"; shift;
                       shift;;
               --)
                       shift; break;;
       esac
done
# echo force is : "'"$force"'"
# echo dest is "'"$dest"'"

cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "init.sh" \
        --exclude "README.md" --exclude "LICENSE" -vr . $dest

    source ~/.bashrc
}

if [ "$force" == "1" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt

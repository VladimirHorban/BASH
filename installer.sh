MODE=$1
#DESTINATION=$2
DESTINATION="/Users/vhorban/Desktop/f2"
USER=$(whoami)
#$HOME/.my-settings tar -xzv -C ${DESTINATION

if [ $MODE == "install" ]; then
    mkdir -p ${DESTINATION}
    ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0`
    tail -n+$ARCHIVE $0 | tar xzv -C $DESTINATION
    #echo "${DESTINATION}" >> /Users/$USER/my-settings.txt
elif [ $MODE == "deinstall" ]; then
    path=$(head -n 1 /Users/$USER/my-settings.txt)
    echo $path
    rm -rf $path
    #echo "$path" >> /Users/$USER/my-oldsettings.txt
elif [ $MODE == "help" ]; then
    echo "Hello bro!"
    echo "To install use : script.sh install"
    echo "To deinstall use : script.sh deinstall"
else
    echo "You inputed wrong mode! See help : ./script.sh help"
fi

exit 0

__ARCHIVE_BELOW__
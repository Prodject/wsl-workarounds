# >>>>> wsl-mount-fix >>>>> #

if ! mount | grep -q "C: on /mnt/c type drvfs (rw,noatime,fallback=1)"; then
    echo -e "\033[32;49m−→\033[39;49m\033[1m Mounting C:\ drive...\033[0m"
    pushd ~ > /dev/null
    sudo umount /mnt/c
    sudo mount -t drvfs -o noatime,fallback=1 C: /mnt/c
    popd > /dev/null
fi

# <<<<< wsl-mount-fix <<<<< #
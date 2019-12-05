#!/bin/bash

# $1 set metod cksum or md5sum
# $2 set folder for to use script
set -x

if [[ $1 = "cksum" ]];
then
	if find ~/Downloads/sums -type d | grep cksum; then
		echo "Folder exist"
	else
		mkdir ~/Downloads/sums
		mkdir ~/Downloads/sums/cksum
		mkdir ~/Downloads/sums/cksum/old
	fi
else
	if find ~/Downloads/sums -type d | grep md5sum; then
                echo "Folder exist"
        else
		mkdir ~/Downloads/sums
		mkdir ~/Downloads/sums/md5sum
		mkdir ~/Downloads/sums/md5sum/old
        fi

fi

if [[ $1 = "cksum" ]];
then
	if find ~/Downloads/sums/cksum/ -type f | grep cksums; then
		mv ~/Downloads/sums/cksum/*.ck ~/Downloads/sums/cksum/old
		find -type f -exec $1 $2 "{}" \; >> ~/Downloads/sums/cksum/cksums$(date +%y%m%d_%H%M).ck
	else
		find -type f -exec $1 $2 "{}" \; >> ~/Downloads/sums/cksum/cksums$(date +%y%m%d_%H%M).ck
	fi
else
	if find ~/Downloads/sums/md5sum/ -type f | grep md5sums; then
		mv ~/Downloads/sums/md5sum/*.md5 ~/Downloads/sums/md5sum/old
		find -type f -exec $1 $2 "{}" \; >> ~/Downloads/sums/md5sum/md5sums$(date +%y%m%d_%H%M).md5
	else
		find -type f -exec $1 $2 "{}" \; >> ~/Downloads/sums/md5sum/md5sums$(date +%y%m%d_%H%M).md5
		echo "File md5sums$(date +%y%m%d_%H%M).md5 is created in ~/Downloads/sums/md5sum/"
	fi
fi

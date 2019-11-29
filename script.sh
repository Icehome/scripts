#!/bin/bash

# $1 set metod cksum or md5sum
# $2 set folder for to use script


mkdir ~/Downloads/sums

if [[ $1 == "cksum" ]]; 
then
    mkdir ~/Downloads/sums/cksum 
    mkdir ~/Downloads/sums/cksum/old
else
    mkdir ~/Downloads/sums/md5sum
    mkdir ~/Downloads/sums/md5sum/old
fi

if [[ $1 == "cksum" ]];
then
	#check_file=$(find ~/Downloads/sums/md5sum cksums$(date +%y%m%d).ck | grep cksum$(date +%y%m%d).ck)
	find -type f -exec $1 $2 "{}" \; >> cksums$(date +%y%m%d_%H%M).ck
	mv cksums*.ck ~/Downloads/sums/cksum/

#	if [[ -n $check_file ]];
#		then
#		find -type f -exec $1 $2 "{}" \; >> ~/Downloads/sums/cksum/cksums$(date +%y%m%d).ck
#		else
#		mv ~/Downloads/sums/cksum/$check_file ~/Downloads/sums/cksum/old$check_file
#		find -type f -exec $1 $2 "{}" \; >> $2/summs/cksum/cksums$(date +%y%m%d).ck
#		fi

else
#	check_file=$(find md5sums$(date +%y%m%d).md5  | grep md5sum$(date +%y%m%d).md5)
	find -type f -exec $1 $2 "{}" \; >> md5sums$(date +%y%m%d_%H%M).md5
	mv md5sums*.md5 ~/Downloads/sums/md5sum/
	echo "File md5sums$(date +%y%m%d_%H%M).md5 is created in ~/Downloads/sums/md5sum/"
#        if [[ -n $check_file ]];
#                then
#                find -type f -exec $1 $2 "{}" \; >> ~/Downloads/sums/md5sum/md5sums$(date +%y%m%d).md5
#                else
#                mv ~/Downloads/sums/md5sum/$check_file ~/Downloads/sums/md5sum/old/$check_file
#                find -type f -exec $1 $2 "{}" \; >> ~/Downloads/sums/md5sum/md5sums$(date +%y%m%d).md5
#	fi
fi

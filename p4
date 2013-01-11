#!/bin/sh

cur_path=`pwd`
config_file_path=$cur_path/.p4config

if [ -f $config_file_path ]
then
	export P4CONFIG=$config_file_path
else
	while [ -O $cur_path ]
	do
	#	echo $cur_path
		if [ -f $cur_path"/.p4config" ]
		then
			export P4CONFIG=$cur_path"/.p4config"
			break
		fi
		cur_path=`cd .. && pwd`
	done
fi

p4c "$@"

exit 0

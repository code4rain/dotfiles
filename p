#!/bin/sh

current_path=`pwd`
#root_path=`pwd | awk -F \/ '{print $4}'`
root_path=`dirname $current_path`
config_file_path=~/$root_path/.p4config

#echo $config_file_path

if [ -f $config_file_path ]
then
	export P4CONFIG=$config_file_path
else
	config_file_path="`pwd`"
	while [ -O `dirname $config_file_path` ]
	do
		if [ -f $config_file_path"/.p4config" ]
		then
			export P4CONFIG=$config_file_path"/.p4config"
			break
		fi
		config_file_path="`dirname $config_file_path`"
	done
fi


p4 "$@"


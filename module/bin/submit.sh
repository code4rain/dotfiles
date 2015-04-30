#!/usr/bin/env bash

# Change p4 command if you use another p4 script.
P4C="p4"
cur_path=`pwd`
config_file_path=$cur_path/.p4config

if [ -f $config_file_path ]
then
	source $config_file_path
else
	while [ -O $cur_path ]
	do
		if [ -f $cur_path"/.p4config" ]
		then
			source $cur_path"/.p4config"
			break
		fi
		cur_path=`cd $cur_path && cd .. && pwd`
	done
fi

usage()
{
	echo "Usage: $0"
	echo "\twithout option, sl will shelve last pending CL"
	echo "-y : Submit CL without asking"
	echo "-c : using specific Change List # instead of last pending CL"
	echo "-v : Verbose"
}

# echo "$P4C changes -u $P4USER -m $1 -s pending"
CLS=`$P4C changes -m 1 -u $P4USER -c $P4CLIENT -s pending | awk '{ print $2 } '`

# A POSIX variable
OPTIND=1 # Reset in case getopts has been used previously in the shell.

while getopts ":yc:v" o; do
	case "${o}" in
		y)
			SUBMIT_YES=1
			;;
		c)
			CLS=${OPTARG}
			;;
		v)
			VERBOSE=1
			;;
		*)
			usage
			exit 0
			;;
	esac
done

for cl in "$CLS"
do
cat << EOF
	----------------------------------------------------
	USER:		$P4USER
	CLIENT:		$P4CLIENT
	SUBMIT CL:	$cl
	----------------------------------------------------
EOF
  $P4C shelve -r -c $cl
  if [[ "$SUBMIT_YES" -eq 1 ]]
  then
    $P4C describe -du -s $cl | colordiff | less -R
    $P4C shelve -d -c $cl
		$P4C submit -c $cl
  else
    $P4C describe -du -s $cl | colordiff | less -R
    echo -n "Want to submit this? (y/N) > "
    read yn
    if [[ $yn == "Y" || $yn == "y" ]] ; then
      $P4C shelve -d -c $cl
      echo "$P4C submit -c $cl"
      $P4C submit -c $cl
    fi
  fi
done

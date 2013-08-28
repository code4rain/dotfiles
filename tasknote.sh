#!/bin/bash

###############################################################################
# tasknote - associate note file with individual tasks in taskwarrior
#
# Copyright 2011, Alan Bowen, bowen@tcnj.edu.
# All rights reserved.
#
# Copyright 2012, Scott Kostyshak, skostysh@princeton.edu.
# (fixed some bugs, made compatible with Taskwarrior 2.2.0, and added
# error handling)
#
# based on taskopen - file based notes with taskwarrior
#
# Copyright 2010, Johannes Schlatow.
# All rights reserved.
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the
#
#     Free Software Foundation, Inc.,
#     51 Franklin Street, Fifth Floor,
#     Boston, MA
#     02110-1301
#     USA
#
###############################################################################

# Updated by Scott Kostyshak on 27 November 2012.
# Tested with Taskwarrior 2.2.0.
# Changelog:
# - Use the 'uuid' command to get UUIDs instead of parsing.
# - Test return of UUIDs and give an error if something is off.
# - Folder no longer needs to have a slash at the end.
# - Error given if tasknote folder does not exist.
# - Unify whitespace and comment style.

EDITOR=vim
TASKBIN=task

# If you sync tasks FOLDER should be a location that syncs and is available to
# other computers, i.e. /users/dropbox/tasknotes
# FOLDER to store notes in, must already exist!
FOLDER="/users/dropbox/taskwarrior/tasknotes/"
if [ ! -d $FOLDER ]; then
  echo "Folder does not exist. Please edit the tasknote script and choose a folder that exists for where to store your notes." 1>&2
  exit 1
fi

# Preferred extension for tasknotes
EXT=".txt"

# Message that gets annotated to the task to indicate that notes exist
NOTEMSG="Notes"

# Display usage if task number not supplied on cli
if [ $# != 1 ]; then
  echo "Usage: $0 <id>" 1>&2
  exit 2
fi

# Find UUID from given task
uuid=$( $TASKBIN rc._forcecolor=no rc.defaultwidth=300 $* uuid 2>/dev/null )
num_returned=$( echo $uuid | grep -o , | wc -l )
if [ "$uuid" == "" ]; then
  echo "No UUID returned. Make sure <id> is valid." 1>&2
  exit 2
elif [ $num_returned != 0 ]; then
  echo "More than one UUID returned. This should not happen." 1>&2
  exit 3
fi

# Build full path & file name to store notes in
file="$FOLDER/$uuid$EXT"

# Determine if notes file already exists
fileexists=0
if [ -f $file ]; then
  fileexists=1
fi

# Create/edit $file with editor
$SHELL -c "$EDITOR $file"

# If note was just created, add NOTEMSG as annotation to task
if [ $fileexists = 0 ]; then
  if [ -f $file ]; then
    $SHELL -c "$TASKBIN $* annotate $NOTEMSG"
  fi
fi

exit 0

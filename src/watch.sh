#!/bin/bash
#Author: https://github.com/123kubix123

setup_watcher(){
   echo "Starting to watch ${1}..."
   inotifywait -m -e modify $1 |
   while read file_path file_event file_name; do
      if [ "$DEBUG" = true ] ; then
         echo ${file_path}${file_name} event: ${file_event}
         echo "Copying ${1} to back.${1}"
      fi
      cp $1 "back.${1}"
      chmod 644 "back.${1}"
   done
}


for FILE in $WATCHLIST
   do
      setup_watcher "$FILE" &
   done

sleep infinity

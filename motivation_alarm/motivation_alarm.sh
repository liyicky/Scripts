#!/usr/bin/env bash

osascript -e "set volume 10"

ls ~/Catode/Scripts/motivation_alarm/books/**.m** | sort -R | tail -1 | while read file; do
    terminal-notifier -title "Motivation Alarm" -message "Playing $file";
    osascript -e 'tell application "Terminal" to do script "mpg123 --title -v '$file'"';
done

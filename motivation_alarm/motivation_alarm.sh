#!/usr/bin/env bash

osascript -e "set volume 10"

ls books/**.m** | sort -R | tail -1 | while read file; do
    terminal-notifier -title "Motivation Alarm" -message "Playing $file";
    open $file;
done

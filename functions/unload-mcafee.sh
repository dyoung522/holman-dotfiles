#!/bin/bash
for F in /Library/LaunchDaemons/com.mcafee* ; do 
  sudo launchctl unload $F 
done

#!/bin/bash
    if [ -z "$(ps -C DreamDaemon | grep DreamDaemon)" ]
    then
        /root/byond/bin/DreamDaemon /root/sso/EOTSUPDATE.dmb 2200 -safe -log ./logfile -core -trace &
    fi

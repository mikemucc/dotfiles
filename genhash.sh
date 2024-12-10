#!/bin/bash
genHash ()
{
    userName=$(whoami)
    userPW="$(security find-generic-password -s 'Enterprise Connect' -w -a $userName)"
    expect -c "
        log_user 0
        spawn /usr/local/bin/cntlm -H -u "$userName"
        expect \"Password:\"
        send ${userPW}\n
        log_user 1
        expect eof
    "
}

genHash
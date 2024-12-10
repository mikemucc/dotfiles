#!/bin/bash


genHash ()
{
    userName=$(whoami)
    userPW="$(security find-generic-password -s '' -w -a $userName)"
    expect -c "
        log_user 0
        spawn /usr/local/bin/cntlm -H -u "$userName"
        expect \"Password:\"
        send ${userPW}\n
        log_user 1
        expect eof
    "
}

cntlmUpdate ()
{
echo "Checking to see if CNTLM configuration needs updating..."
if [[ -w /usr/local/etc/cntlm.conf && -e /usr/local/bin/cntlm ]]
	then
		echo "Found cntlm binary and conf in standard location.  Conf file is writable."
		echo "Checking to see if cntlm is running..."
		if [[ `pgrep cntlm` ]]
			then
				echo "cntlm is running.  killing..."
				cntlmStatus=1
				# killall does not work well to stop cntlm
				# we will look for each instance of cntlm and kill explicitly
				for cntlmProcessID in $(pgrep cntlm)
					do
						echo "Killing Process ID $cntlmProcessID ..."
						kill -9 $cntlmProcessID
					done
			else
				echo "cntlm is not running.  proceeding..."
				cntlmStatus=0
		fi
		echo "Removing previous hashes from configuration file..."
		sed -i ".backup" '/PassNTLMv2/d' /usr/local/etc/cntlm.conf
  		sed -i ".backup" '/PassNT/d' /usr/local/etc/cntlm.conf
  		sed -i ".backup" '/PassLM/d' /usr/local/etc/cntlm.conf
  		echo "Writing new hashes to configuraiton file..."
  		genHash >> /usr/local/etc/cntlm.conf
  		if (( $? == 0 ))
  			then
  				echo "Successfully created new hashes."
  				if (( $cntlmStatus == 1 ))
  					then
  						echo "Since we killed cntlm earlier, let's start it back up..."
  						echo "Pausing a second..."
  						sleep 1
  						echo "Starting up cntlm..."
  						/usr/local/bin/cntlm
					else
						echo "Since cntlm was not running before we started, we will not start it up."
				fi
  			else
  				echo "Error attempting to generate new pass hashes for CNTLM."
  		fi
	else
		echo "CNTLM is either not installed, or the binary or conf file is not in standard location"
		echo "Checking to see if cntlm is running anyway..."
		if [[ `pgrep cntlm` ]]
			then
				echo "cntlm is running.  Killing process and warning user that update can not occur..."
				# killall doesn't work well to stop cntlm
				# we will look for each instance of cntlm and kill explicitly
				for cntlmProcessID in $(pgrep cntlm)
					do
						echo "Killing Process ID $cntlmProcessID ..."
						kill -9 $cntlmProcessID
					done
				cntlmWarning
			else
				echo "cntlm is not running.  proceeding..."
		fi
fi
}

cntlmUpdate
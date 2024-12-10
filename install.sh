#!/bin/bash

# Link local files to . files in home directory
echo "Trying to link $(pwd)/aliases to ${HOME}/.aliases..."
if [ ! -f ${HOME}/.aliases ]; then
    ln -s $(pwd)/aliases ${HOME}/.aliases
    echo "...success."
else
    echo "${HOME}/.aliases exists, not overwriting the link..."
fi

echo

echo "Trying to link $(pwd)/gitexcludes to ${HOME}/.gitexcludes..."
if [ ! -f ${HOME}/.gitexcludes ]; then
    ln -s $(pwd)/gitexcludes ${HOME}/.gitexcludes
    echo "...success."
else
    echo "${HOME}/.gitexcludes exists, not overwriting the link..."
fi

echo

echo "Trying to link ${HOME}/.bash_profile to ${HOME}/.bashrc..."
if [ ! -f ${HOME}/.bashrc ]; then
    ln -s ${HOME}/.bash_profile ${HOME}/.bashrc
    echo "...success."
else
    echo "${HOME}/.bashrc exists, not overwriting the link..."
fi

echo

# Check for sourcing info and add to .bash_profile if absent
echo "Checking for source line..."
if grep -Fxq 'source ${HOME}/.aliases' "${HOME}/.bash_profile" || grep -Fxq '. ${HOME}/.aliases' "${HOME}/.bash_profile"   ; then 
    echo "...source line exists, not adding to .bash_profile"; 
    # echo true;
    else
    # echo false;
    echo "Writing source line to .bash_profile"
    echo '#Import my Aliases' >> ${HOME}/.bash_profile
    echo 'source ${HOME}/.aliases' >> ${HOME}/.bash_profile
    echo "Source line added, please source ~/.bash_profile to get the new aliases"
    fi
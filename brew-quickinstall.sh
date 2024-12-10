#!/bin/bash

declare -a brewlist=("thefuck"
                     "starship"
                     "python3"
                     "aws"
                     "font-inconsolata-nerd-font"
                     "font-jetbrains-mono-nerd-font")

declare -a casklist=("visual-studio-code"
                     "xquartz"
                    #  "virtualbox"
                    #  "virtualbox-extension-pack"
                    #  "vagrant"
                     "quicklook-json"
                     "iterm2"
                     "qlmarkdown")

for i in "${casklist[@]}"
do
    brew install --cask $i
done
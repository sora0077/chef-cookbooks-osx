#!/bin/sh

xcode-select -p 2> /dev/null
if [ $? -ne 0 ]; then
    echo 'Install Xcode Commandline Tools'
    xcode-select --install

    echo 'Please Enter after install finished'
    read INPUT

    sudo sh <<SCRIPT
SCRIPT

fi
#echo 'Install Homebrew'
#ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

if [ ! -d "/opt/chef/" ]; then
    echo 'Install Chef'
    curl -L https://www.opscode.com/chef/install.sh | sudo `echo $SHELL`
    sudo /opt/chef/embedded/bin/gem install knife-solo
    sudo /opt/chef/embedded/bin/gem install librarian-chef

fi
echo 'Install or Update Cheffile'
/opt/chef/embedded/bin/librarian-chef install

echo 'Install Recipes'
sudo chef-solo -c ./config/solo.rb -j ./nodes/localhost.json

echo 'Done!'

#!/bin/bash

#Install brew
if which brew > /dev/null;
then
    echo "Good job brew is installed"
else ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Setting up brew to install programs..."
brew tap caskroom/cask
brew update

echo "Installing brew modules"
brew install git nodejs ruby cask zsh wget python3 htop wakeonlan parallel

echo "Installing brew taps"
brew tap railwaycat/emacsmacport

#brew install emacs-mac
echo "Installing brew casks..."
#Install some casks
brew cask install cscreen discord fetch google-chrome firefox postman sublime-text atom wireshark vlc spectacle keepingyouawake licecap tunnelblick iterm2 cyberduck scroll-reverser flux the-unarchiver fluor scroll-reverser pdftotext gimp java sourcetree viscosity chromedriver wget

echo "Installing Intellij"
brew cask install caskroom/cask/intellij-idea-ce

echo "Installing maven"
#maven requires java so needed to install that first
brew install maven

echo "Installing purecloud"
wget https://dhqbrvplips7x.cloudfront.net/directory-mac/322/purecloud-mac-1.11.342.pkg -P ~/Downloads/
sudo installer -pkg ~/Downloads/purecloud-mac* -target /

#setup ssh key
echo "Lets setup an ssh key"
echo "~~~~Use the default location provided for the ssh key~~~~"
echo "~~~~Use an empty passphrase for the sshe key~~~~"
ssh-keygen -t rsa

echo "Time to install oh-my-zsh"
#install oh-my-zsh
if which zsh > /dev/null;
then
  echo "congratulations zsh is installed!"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  #switch default shell to zsh
  chsh -s $(which zsh)
else
  echo "Zsh is not installed. Go do that and then install oh-my-zsh"
fi

# Install Xcode Command-Line Tools
if ! xcode-select -p ; then
    xcode-select --install
    exit 0
fi
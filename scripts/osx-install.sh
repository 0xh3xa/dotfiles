#!/usr/bin/env bash

# Make sure Xcode is installed before running this script

# Install command line tools if not installed
xcode-select -p
if [[ $? -ne 0 ]]; then
    xcode-select --install
fi

# Update all OSX packages
sudo softwareupdate -i -a

# Link airport binary
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

# Install iojs-v2 and set it as default
nvm install iojs-v2
nvm alias default iojs-v2

# Install Homebrew if not installed
brew --version
if [[ $? -ne 0 ]]; then
    # Clean-up failed Homebrew install
    rm -rf "/usr/local/Cellar" "/usr/local/.git"
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade

# Install essential packages
brew install thefuck
brew install vim
brew install git
brew install hub
brew install watchman
brew install flow
brew install xctool
brew install swiftlint
brew install rbenv
brew install rbenv-bundler
brew install youtube-dl
brew install imagemagick

# Install essential node packages
npm install -g react-native-cli
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react

# Install Cask
brew tap caskroom/cask
brew install brew-cask

# Install essential apps
# brew cask install atext
# brew cask install desktime
brew cask install bettertouchtool
brew cask install gitup
brew cask install slack
brew cask install lastpass
brew cask install flux
brew cask install teamviewer
brew cask install dropbox
brew cask install google-drive
brew cask install fabric
brew cask install aluxian-messenger
brew cask install vlc
brew cask install spotify
brew cask install skype
brew cask install torbrowser
brew cask install imageoptim
brew cask install cd-to
brew cask install gfxcardstatus
brew cask install jdownloader
brew cask install subtitles
brew cask install steam
brew cask install openemu    # TODO: Script for backing up ROMs and save files.
brew cask install bit-slicer
brew cask install onyx
brew cask install cleanmymac

# Install QuickLook plugins
# Source: https://github.com/sindresorhus/quick-look-plugins
brew cask install betterzipql
brew cask install cert-quicklook
brew cask install epubquicklook
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install suspicious-package
brew cask install webp-quicklook
qlmanage -r

# Clean things up
brew linkapps
brew cleanup
brew prune
brew cask cleanup

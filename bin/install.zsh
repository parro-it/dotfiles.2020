#!/bin/zsh

cd $HOME
set -e
which curl git

if [[ -f repos ]]; then
    echo "Error: alien 'repos' directory on the way."
    echo "Please rename 'repos' directory and repeat the command:"
    echo "curl parroit.ebansoft.com | zsh"
    exit 1
fi

if [[ -d repos ]]; then
    echo "Error: alien 'repos' directory on the way."
    echo "Please rename 'repos' directory and repeat the command:"
    echo "mv ~/repos ~/repos.OLD"
    echo "curl parroit.ebansoft.com | zsh"
    exit 1
fi

if [[ -f bin ]]; then
    echo "Error: alien '~/bin' file on the way."
    echo "Please rename '~/bin' file and repeat the command."
    echo "mv ~/bin ~/bin.OLD"
    echo "curl parroit.ebansoft.com | zsh"
    exit 1
fi

if [[ -d ~/bin ]]; then
    echo "Error: alien '~/bin' directory on the way."
    echo "Please rename '~/bin' file and repeat the command."
    echo "mv ~/bin ~/bin.OLD"
    echo "curl parroit.ebansoft.com | zsh"
    exit 1
fi

echo "Installing modern development environment."

echo "Creating bin directory"
mkdir -p ~/bin

echo "Creating repos directory"
mkdir -p ~/repos
DOTFILES=~/repos/dotfiles.2020

echo "Installing parro-it modern 2020 dotfiles..."
git clone https://github.com/parro-it/dotfiles.2020 $DOTFILES

echo "Installing micro..."
cd ~/bin
curl https://getmic.ro | zsh
mkdir -p ~/.config/micro
cd ~/.config/micro
ln -fs $DOTFILES/config/micro/* .

cd ~
echo "Installing Oh My Zsh..."
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/.config/zsh
ln -fs ~/repos/dotfiles.2020/.gitconfig
ln -fs ~/repos/dotfiles.2020/.zshrc

echo "Installing gvm..."
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | zsh

echo "Installing joe..."
cd ~/bin 
curl -fLo joe https://github.com/karan/joe/releases/download/1.0.3/joe
chmod +x joe
joe u
cd ~

ln -s $DOTFILES/bin/* ~/bin
mkdir -p ~/.ssh
ln -s $DOTFILES/config/ssh/config ~/.ssh
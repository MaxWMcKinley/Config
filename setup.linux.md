# Setup Standard Directories
```fish
mkdir ~/code
mkdir ~/lib
```

# Setup Fish
## Install Fish
```fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish
```

## Setup Config Files
```fish
ln -s ~/lib/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s ~/lib/dotfiles/fish/fish_plugins ~/.config/fish/fish_plugins
```

## Install Fisher and Load Fisher File
```fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
cd ~/.config/fish
fisher update
```

# Setup Doom
## Install Emacs
```fish
sudo snap install emacs --classic
```

## Install Dependencies
```fish
sudo apt install git ripgrep fd-find
```

## Install Doom
```fish
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

## Install Vterm Dependencies
```fish
sudo snap install cmake # vterm dependency
sudo apt install libtool-bin # vterm dependency
```

# Setup Git 
```fish
ln -s ~/lib/dotfiles/git/gitconfig ~/.gitconfig
```

# Setup Colorls
## Install Nerd Fonts
```fish
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/lib/nerd-fonts
cd ~/lib/nerd-fonts
bash ./install.sh
```

## Install Ruby
```fish
sudo snap install ruby --classic
```

## Install Colorls
```fish
gem install colors
```

# Install Apps
## Discord
```fish
sudo snap install discord
```

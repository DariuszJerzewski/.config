#! /bin/sh

# ZSH =========================================================================
if [ -f /etc/arch-release ]; then
	sudo pacman -S zsh
elif [ -f /etc/lsb-release ]; then
	sudo apt-get install zsh
elif [ 'darwin' == `uname | tr '[:upper:]' '[:lower:]'` ]; then
	brew install zsh
fi

pushd ~
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
popd

mv ~/.zshrc ~/.zshrc.install.bak
cp .zshrc ~/.zshrc

# TASKWARRIOR =================================================================
if [ -f /etc/arch-release ]; then
	sudo pacman -S task taskd
elif [ -f /etc/lsb-release ]; then
	sudo apt-get install taskwarrior taskd
elif [ 'darwin' == `uname | tr '[:upper:]' '[:lower:]'` ]; then
	brew install task taskd
fi


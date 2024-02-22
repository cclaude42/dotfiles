# Install zsh
brew install zsh || apt install zsh || apt-get install zsh || yum install zsh

# Install oh-my-zsh
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

# Install fonts
mkdir -p ~/.fonts && cp -rf .fonts/* ~/.fonts
brew install fontconfig || apt install fontconfig || apt-get install fontconfig || yum install fontconfig
fc-cache -f -v

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Overwrite dotfiles
cp -rf .zshrc ~/
cp -rf .p10k.zsh ~/
cp -rf settings.json ~/.config/Code/User/

# Run zsh
exec zsh

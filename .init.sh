# Requirements :
# 

# Install zsh
brew install zsh || apt install zsh || apt-get install zsh || yum install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Install fonts
cp -rf .fonts ~/

# Overwrite dotfiles
cp -rf .zshrc ~/
cp -rf .p10k.zsh ~/

# Run zsh
exec zsh
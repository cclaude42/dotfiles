# Install zsh
brew install zsh || apt install zsh || apt-get install zsh || yum install zsh

# Install starship
brew install starship

# Install cli tools
brew install eza bat zoxide

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions

# Overwrite dotfiles
cp -rf .zshrc ~/
cp -rf settings.json ~/Library/Application\ Support/Cursor/User/
cp -rf starship.toml ~/.config/
cp -rf aws-config ~/.aws/

# Run starship
eval "$(starship init zsh)"

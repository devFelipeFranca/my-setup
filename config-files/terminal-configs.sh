git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

cat <<EOL > ~/.zshrc
# Configuração do Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Temas
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source \$ZSH/oh-my-zsh.sh

# bun completions
[ -s "/home/ff/.bun/_bun" ] && source "/home/ff/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias v='nvim'

# Inicializa o starship se instalado
if command -v starship &> /dev/null
then
    eval "\$(starship init zsh)"
fi
EOL

echo "Configuração concluída. Por favor, reinicie o terminal ou execute 'source ~/.zshrc' para aplicar as alterações."

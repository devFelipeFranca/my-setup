apt install software-properties-common -y
add-apt-repository ppa:deadsnakes/ppa
apt install python3.9 -y
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.9 get-pip.py
pip install pynvim -y

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

add-apt-repository ppa:neovim-ppa/unstable
apt update
wait apt install neovim -y

mkdir /root/.config
mkdir /root/.config/nvim

mv /root/init.vim /root/.config/nvim/

apt update && apt install -y zsh git curl fonts-powerline

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

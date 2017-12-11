mkdir -p ~/.vim/autoload ~/.vim/bundle &&
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &&
cat > ~/.vimrc << EOF &&
execute pathogen#infect()
syntax on
filetype plugin indent on
EOF
cd ~/.vim/bundle &&
git clone https://github.com/rust-lang/rust.vim.git &&
cd ~/.vim/bundle &&
git clone https://github.com/Valloric/YouCompleteMe &&
cd ~/.vim/bundle/YouCompleteMe &&
git submodule update --init --recursive &&
./install.py --rust-completer &&
cargo install racer &&
echo "let g:ycm_rust_src_path="~/.rustup/toolchains/stable-*/lib/rustlib/src/rust/src/""

#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

ln -s $parent_path/hg/hgignore ~/.hgignore
ln -s $parent_path/hg/hgrc ~/.hgrc

ln -s $parent_path/qumulo/qumulorc ~/.qumulorc

ln -s $parent_path/ssh/config ~/.ssh/config
ln -s $parent_path/ssh/id_ecdsa.pub ~/.ssh/id_ecdsa.pub

ln -s $parent_path/vim/vimrc ~/.vimrc

ln -s $parent_path/bash/bash_aliases ~/.bash_aliases
ln -s $parent_path/zsh/zshrc ~/.zshrc

#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )


ln -s $parent_path/dotfiles/vimrc ~/.vimrc
ln -s $parent_path/dotfiles/zshrc ~/.zshrc
ln -s $parent_path/dotfiles/tmux/tmux.conf ~/.tmux.conf

ln -s $parent_path/dotfiles/bash_aliases ~/.bash_aliases

ln -s $parent_path/zsh/zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
ln -s $parent_path/ohmyzsh ~/.ohmyzsh
ln -s $parent_path/oh-my-zsh/custom ~/.ohmyzsh-custom

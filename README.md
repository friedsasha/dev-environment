Dev environment setup. Needs a lot of work

# Dev Machine Setup

-Install terminal emulator like alacritty
(Do this on local machine if remoting in to a dev box)
```
touch ~/.config/alacritty/alacritty.yml
```
Copy contents from alacritty.yml in this repo.

Install fonts like [mononoki](https://madmalik.github.io/mononoki/).

On the dev machine, which may be remote, clone this repo. 
After cloning, from the root of the repo run:
```
git submodule update --init
```
This will clone submodules like oh-my-zsh and plugins.
Then run setup_script.sh. This will link various dot files to ones in this repo.

Vim plugins should be installed automagically after vim is opened for the first
time.

Change the shell to zsh:
`cat /etc/shells` to list available shells.
Sudo access is required to change shells (even for a particular users)
```
sudo chsh -s /bin/zsh sasha
```

If not prompted to do so, run `pk10 configure` to configure oh-my-zsh theme. If
you want to use the symbols, download the [recommended font](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) 
nd change the following in `~/.config/alacritty/alacritty.yml`:
```
font:
  normal:
    family: "MesloLGS NF"
```
(Symbols are not available in mononoki).

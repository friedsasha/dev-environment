Dev environment setup. Needs a lot of work

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

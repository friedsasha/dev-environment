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

Install pyenv:
```
$ curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```
Ensure the following is in your .zshrc or similar:
```
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```
Install the latest version of python
```
pyenv install 3.8.3 -v
pyenv global 3.8.3
```

# SSH Setup
To ssh into a remote box without having to provide your password, add your local machine's public key to the ~/.ssh/authorized_keys file on the remote box:
First, generate an ssh key on your local machine:
```
$ ssh-keygen -t ed25519
```
Load then key into memory:
```
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
```
Then add the public key to the remote machine's authorized_keys file:  
```
$ cat ~/.ssh/id_rsa.pub | ssh USER@HOST "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```
Ensure the ssh permissions are correct on the remote machine:
```
$ chmod 700 .ssh
$ chmod 600 authorized_keys
```
To get the numerical chmod value of a file (Linux):
```
$ stat --format '%a' <file>
```

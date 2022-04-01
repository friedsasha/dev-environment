export XILINX_SDK_PATH="/data/tools/Xilinx/SDK/2019.1"
export PYENV_ROOT="$HOME/.pyenv"
export PYTHONDONTWRITEBYTECODE=1
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"

export TONKA_WORKSPACE="/home/sasha/tonka"
export PROJECT_WORKSPACE="/home/sasha/tonka"

# Activate virtualenvs automatically upon entering/leaving directories
# which contain a .python-version file with a valid virtual environment.
# Run `pyen virtualenvs` to see a list of valid virutal environments.
eval "$(pyenv init -)"
#eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

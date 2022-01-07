alias tonkatime-grep="grep -rli --exclude-dir={build,.git,external,.ccls-cache}"
alias cmake-ppc="cmake -DCMAKE_TOOLCHAIN_FILE=cmake/Toolchain-zcu102.cmake -DBUILD_SHARED_LIBS=on -S . -B build"
alias cmake-ppc-build="cmake --build build --parallel $(nproc --all)"
alias cmake-ppc-install="cmake --install build"

export TONKA_WORKSPACE="/data/sasha/tonka"
export PROJECT_WORKSPACE="/data/sasha/tonka"
export PYTHONPATH=$TONKA_WORKSPACE/tonkatime/build-ppc/tonkatime-staging/python/venv-ppc
export PATH="/home/sasha/.pyenv/bin:$PATH"

# Activate virtualenvs automatically upon entering/leaving directories
# which contain a .python-version file with a valid virtual environment.
# Run `pyen virtualenvs` to see a list of valid virutal environments.
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ------------------------------------------------------------------------------
# Pull base image
FROM fullaxx/ubuntu-desktop:xfce4

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV TZ Etc/Zulu
ENV LANG C

# ------------------------------------------------------------------------------
# Helper functions
COPY scripts/.functions /app/scripts

# ------------------------------------------------------------------------------
# Install scripts
COPY scripts/unminimize.sh /app/scripts
RUN /app/scripts/unminimize.sh

COPY scripts/xfce4-themes.sh /app/scripts
RUN /app/scripts/xfce4-themes.sh

COPY scripts/google-chrome.sh /app/scripts
RUN /app/scripts/google-chrome.sh

COPY scripts/delta.sh /app/scripts
RUN /app/scripts/delta.sh

COPY scripts/drawio.sh /app/scripts
RUN /app/scripts/drawio.sh

COPY scripts/inspectrum.sh /app/scripts
RUN /app/scripts/inspectrum.sh

COPY scripts/lazydocker.sh scripts/docker.sh /app/scripts
RUN /app/scripts/lazydocker.sh

COPY scripts/lazygit.sh /app/scripts
RUN /app/scripts/lazygit.sh

COPY scripts/cuda-toolkit.sh /app/scripts
RUN /app/scripts/cuda-toolkit.sh

COPY scripts/dev-tools.sh /app/scripts
# Using a trailing / in dest arg of COPY will create the dir if nonexistent
COPY packages/system.txt /app/packages/
RUN /app/scripts/dev-tools.sh

COPY scripts/cmake-gcc-c-packages.sh /app/scripts
COPY packages/c.txt /app/packages
RUN /app/scripts/cmake-gcc-c-packages.sh

COPY scripts/pyenv-pip-python-packages.sh /app/scripts
COPY packages/python.txt /app/packages
RUN /app/scripts/pyenv-pip-python-packages.sh

COPY scripts/nvm-npm-node-packages.sh /app/scripts
RUN /app/scripts/nvm-npm-node-packages.sh

COPY scripts/vscode.sh /app/scripts
RUN /app/scripts/vscode.sh

COPY scripts/fira-code.sh /app/scripts
RUN /app/scripts/fira-code.sh

COPY scripts/vim.sh /app/scripts
RUN /app/scripts/vim.sh

# ------------------------------------------------------------------------------
# Copy dotfiles
COPY dotfiles/.bashrc /tmp
COPY dotfiles/.tmux.conf/ /tmp
COPY dotfiles/.config/ /tmp/.config/
COPY dotfiles/.vim/ /tmp/.vim/
COPY dotfiles/.local/ /tmp/.local/

RUN mv /tmp/.bashrc /tmp/.tmux.conf /tmp/.config $HOME
RUN cp -aT /tmp/.vim $HOME/.vim && rm -rf /tmp/.vim
RUN cp -aT /tmp/.local $HOME/.local && rm -rf /tmp/.local

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]


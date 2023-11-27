# ------------------------------------------------------------------------------
# Pull base image
FROM fullaxx/ubuntu-desktop:xfce4

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV TZ Etc/Zulu
ENV LANG C

# ------------------------------------------------------------------------------
# Copy scripts
ADD scripts /app/scripts
RUN find /app/scripts -name '*.sh' -exec chmod a+x {} +

# ------------------------------------------------------------------------------
# Install scripts
RUN /app/scripts/unminimize.sh
RUN /app/scripts/dev-tools.sh
RUN /app/scripts/xfce4-themes.sh
RUN /app/scripts/google-chrome.sh
RUN /app/scripts/deb-packages.sh
RUN /app/scripts/cuda-toolkit.sh
RUN /app/scripts/pyenv-pip-python-packages.sh
RUN /app/scripts/nvm-npm-node-packages.sh
RUN /app/scripts/vscode.sh
RUN /app/scripts/lazy-tools.sh
RUN /app/scripts/inspectrum.sh

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]


# This Dockerfile is used to build a container with the latest version of Neovim.
# It is used to build the mevim-ubuntu and mevim-void images.
#
# To build the mevim-ubuntu image, run the following command:
# docker build -t mevim:1.0.0 --target mevim-ubuntu .
#
# To build the mevim-void image, run the following command:
# docker build -t mevim:1.0.0 --target mevim-void .
#
# Created by: Mounir Erhili
# License: MIT

FROM ghcr.io/void-linux/void-glibc-full:latest AS mevim-void

WORKDIR /root/.config/nvim/

# Install dependencies
RUN xbps-install -Sy xbps
RUN xbps-install -Syu
RUN xbps-install -y git curl wget tar unzip gzip fzf neovim
RUN xbps-install -y fd ripgrep bash bash-completion tree-sitter
RUN xbps-install -y nodejs python python-pip meson gcc clang go
RUN xbps-install -y gdb lldb ninja make cmake

# Clean up XBPS when done.
RUN xbps-remove -yvoO

# Copy the whole repo into the container
COPY . .

# Set the default command to run when the container starts
CMD ["/usr/bin/nvim"]

FROM ubuntu:25.04 AS mevim-ubuntu

WORKDIR /root/.config/nvim/

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y build-essential git curl wget tar unzip gzip fzf
RUN apt install -y fd-find ripgrep bash bash-completion tree-sitter-cli
RUN apt install -y nodejs npm python3 python3-pip meson gcc g++ clang golang
RUN apt install -y gdb lldb ninja-build cmake python3-venv

# Clean up APT when done.
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download and install Neovim
## Download the latest Neovim
RUN curl -LSsO https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz

## Extract Neovim into /opt
RUN tar xpf nvim-linux-x86_64.tar.gz -C /opt

## Clean up
RUN rm nvim-linux-x86_64.tar.gz

## Create symbolic links for nvim, vim, nv and vi
RUN ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
RUN ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/vim
RUN ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nv
RUN ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/vi

# Copy the whole repo into the container
COPY . .

# Set the default command to run when the container starts
CMD ["/usr/local/bin/nvim"]

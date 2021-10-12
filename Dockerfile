FROM debian:sid-slim
LABEL maintainer="Ronan Lanore <ronan.lanore@gmail.com>"

ENV USER_ID 2000
ENV USER_NAME nvim
ENV USER_DIR /home/nvim

COPY ./nvim-linux64.tar.gz /tmp/
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y bash-completion \
      python3-pip \
      nodejs \
      git \
      jq \
      procps \
      curl \
      sudo \
    && echo 'nvim    ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && adduser --uid ${USER_ID} --disabled-password --gecos "Nvim user" ${USER_NAME} \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

USER ${USER_NAME}
WORKDIR ${USER_DIR}

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
    && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.profile \
    && brew install neovim

USER root
RUN sed -e '/^nvim.*/d' /etc/sudoers

USER ${USER_NAME}

CMD ["/bin/bash"]

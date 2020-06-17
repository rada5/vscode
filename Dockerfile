FROM codercom/code-server

# WORKDIR /root

# # install dependency
# RUN apt-get update \
#  && apt-get install -y \
#     libx11-xcb1 \
#     libasound2 \
#     curl \
#     gnupg2 \
#     git \
#     python \
#     g++ \
#     gcc \
#     libc6-dev \
#     make \
#     pkg-config \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*

# # install vscode
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
#  && install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
#  && rm microsoft.gpg \
#  && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
#  && apt-get update \
#  && apt-get install -y code \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*

# COPY scripts /usr/local/bin

# # Install vscode extensions
# COPY extensions.txt /root
# RUN install-extensions.sh

COPY settings.json /root/.code-server/User/settings.jsons

# jq
RUN sudo curl -o /usr/local/bin/jq -L https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && sudo chmod +x /usr/local/bin/jq

# docker compose install
# curl https://api.github.com/repos/docker/compose/releases/latest | jq .name -r
RUN output='/usr/local/bin/docker-compose'
RUN sudo curl -L https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
RUN sudo chmod +x /usr/local/bin/docker-compose



# WORKDIR /root/project
# CMD ["entrypoint.sh"]
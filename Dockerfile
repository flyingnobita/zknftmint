FROM ubuntu:jammy
LABEL maintainer="Flying Nobita <iam@flyingnobita.com>"
EXPOSE 1234

RUN apt-get update
RUN apt-get install -y sudo curl git-core gnupg locales nodejs wget nano

# Default powerline10k theme
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p https://github.com/zsh-users/zsh-history-substring-search \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p gitfast \
    -p command-not-found \
    -p docker \
    -p docker-compose \
    -p safe-paste \
    -p history-substring-search \
    -p https://github.com/lukechilds/zsh-nvm \
    -p z
    # -p ssh-agent \

RUN chsh -s ~/.zshrc
CMD ["zsh"]
FROM ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install   \
    --no-install-recommends                             \
    ca-certificates                                     \
    curl                                                \
    vim                                                 \
    git                                                 \
    build-essential
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y
RUN cd /home && USER=root /root/.cargo/bin/cargo new app
# TODO: for some reason, rust vscode extension can't find rustup in its path,
# hence set the path explicitly
ENV PATH "/root/.cargo/bin:${PATH}"
COPY . /home/app/
WORKDIR /home/app
CMD ["/bin/bash"]

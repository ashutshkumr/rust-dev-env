FROM ubuntu:20.04
ENV PATH "/root/.cargo/bin:${PATH}"
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
COPY . /home/app/
WORKDIR /home/app
CMD ["/bin/bash"]

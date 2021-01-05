# rust-dev-env

Sets up VSCode-based Rust Development Environment inside an Ubuntu Container.

## Setup

- Clone this project, build docker image and spawn a new container.

    ```sh
    git clone https://github.com/ashutshkumr/rust-dev-env.git && cd rust-dev-env
    docker build -t rust-dev-env . && docker run -td rust-dev-env
    ```

- Attach to newly spawned container from VSCode and change current directory to `/home/app`.

- Install recommended extensions (when prompted).


## Prerequisites

To use these files, you must first have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/) (already included in Docker Desktop)

## Usage

The following steps will run a local instance of `quick-spin` using [docker compose](https://docs.docker.com/compose/).

1. Clone this repository.
2. Change directory into the root of the project.
3. Run the `docker compose up` command.

```shell
git clone https://github.com/armory-io/quick-spin.git
cd quick-spin
docker compose up
```

Open Spinnaker UI in your web browser: http://localhost:9000

### Stop quick-spin

If you want to **stop** quick-spin, you can use:

1. `Ctrl + c` keyboard shortcut.
2. `docker compose stop`

This stops running containers without removing them. They can be started again with `docker compose start`

### Remove quick-spin

If you want to remove containers, networks, volumes, and images created by `up`:

```
docker compose down -v --rmi all
```

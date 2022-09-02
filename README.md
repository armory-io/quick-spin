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

## Kubernetes

By default, the quick-spin uses `~/.kube/config` file to get kubernetes configuration.
You can define a different patch for the config file in docker-compose.yml e.g.

```yaml
services:
  quick-spin:
    volumes:
      - type: bind
        source: ~/.kube/config
        target: /home/spinnaker/.kube/config
```

### More kubernetes settings

By this [link](https://docs.armory.io/armory-enterprise/installation/armory-operator/op-manifest-reference/providers/#kubernetes) you can find more information about
kubernetes configuration. All these settings can be defined or changed in `Docker/spinnaker-config/clouddriver.yml` file.

### Local kubernetes cluster

If you want to connect the quick spin to local kubernetes cluster e.g. kind, minikube then you need to open your kubernetes config file and
replace `127.0.0.1` or `localhost` in server host with `host.docker.internal` e.g.

```yaml
# ~/.kube/config
apiVersion: v1
clusters:
- cluster:
    server: https://127.0.0.1:53133
```

to

```yaml
# ~/.kube/config
apiVersion: v1
clusters:
- cluster:
    server: https://host.docker.internal:53133
```

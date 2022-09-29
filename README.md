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

## Local development

To run quick-spin using an image built locally (so not pulling from docker hub), do the following:

```shell
docker compose -f docker-compose-dev.yml up
```

## Custom Settings

On your host machine:

* Use `~/.spinnaker/config/quick-spin-profiles/spinnaker-quick-spin.yml` to define settings for all services.
* Use `~/.spinnaker/config/quick-spin-profiles/{SERVICE_NAME}-quick-spin.yml` to define settings for a particular service.

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

### Create kubernetes resources for cluster

If you want to create a namespace (`quick-spin-sa`), a service account (`quick-spin-sa`) with needed permissions and a kubeconfig (`~/.kube/config`), you need to execute the shell script `quick-spin/Docker/cluster-setup/create-resources.sh`.

! The script uses `LOCAL_KUBECONFIG_FILE` variable, that needs to be updated with your kubeconfig full path. !

This kubeconfig is also used in `docker-compose.yml`.

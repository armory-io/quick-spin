## Prerequisites

To run `quick-spin` you must have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/) (installed with Docker Desktop)

## Usage

To run a local instance of `quick-spin` using [docker compose](https://docs.docker.com/compose/):

1. Clone this repository.
2. Change directory into the project root.
3. Run the `docker compose up` command.

For example:

```shell
git clone https://github.com/armory-io/quick-spin.git
cd quick-spin
docker compose up
```

4. Open the Spinnaker UI in your web browser: http://localhost:9000

### Stop quick-spin

To **stop** `quick-spin`:

1. Use the `Ctrl + c` keyboard shortcut.
2. Use the  `docker compose stop` command.

This stops running the `quick-spin` containers.  
The containers are not removed. 
Start `quick-spin` again using `docker compose start`.

### Remove quick-spin

To completely the `quick-spin` containers, networks, volumes, and images use:

```shell
docker compose down -v --rmi all
```

## Local development

To run quick-spin using an image built locally (so not pulling from docker hub), do the following:

```shell
docker compose -f docker-compose-dev.yml up
```

## Kubernetes

By default, `quick-spin` uses the `~/.kube/config` kubernetes configuration file.
To define a customs patch update the target in the `docker-compose.yml` file. For example:

```yaml
services:
  quick-spin:
    volumes:
      - type: bind
        source: ~/.kube/config
        target: /home/spinnaker/.kube/config
```

### More kubernetes settings

Define or change the `quick-spin` settings in the `Docker/spinnaker-config/clouddriver.yml` file.

For more information about Kubernetes configuration see: [link](https://docs.armory.io/armory-enterprise/installation/armory-operator/op-manifest-reference/providers/#kubernetes). 

### Local kubernetes cluster

To connect `quick-spin` to a local kubernetes cluster (_kind_ or _minikube_),
update the `~/.kube/config` file `server:`  `localhost` (127.0.0.1) value to `host.docker.internal`. 

For example:

Change this default configuration:

```yaml
# ~/.kube/config
apiVersion: v1
clusters:
- cluster:
    server: https://127.0.0.1:53133
```

to:

```yaml
# ~/.kube/config
apiVersion: v1
clusters:
- cluster:
    server: https://host.docker.internal:53133
```

### Create kubernetes resources for cluster

To create a namespace (`quick-spin-sa`), a service account (`quick-spin-sa`), with needed permissions and a kubeconfig (`~/.kube/kubeconfig.quick-spin`), execute the shell script:

```shell
quick-spin/Docker/cluster-setup/create-resources.sh`
```
> The script uses the `LOCAL_KUBECONFIG_FILE` variable. This variable must be updated with your kubeconfig full path.

This kubeconfig is also used in `docker-compose.yml`.

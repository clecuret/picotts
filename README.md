# Goal

Main interests of this recipe is to managed audio (pulse) needed to use picotts in docker.

## Build

To build image, simply launch :
```
docker build -t picotts .
```


## Run

To launch docker container, a bash alias file is certainly the good option :

```bash
docker_me=" -e UID=`id -u` -e GID=`id -g`"
docker_pulse=" -v /run/user/`id -u`/pulse:/run/pulse "

function dis {
    docker run --rm -ti  $docker_pulse   $docker_me picotts picotts \'"$*"\'
}
```
now you can use :
```bash
dis Bonjour
```

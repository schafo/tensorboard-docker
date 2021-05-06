# TensorBoard on Docker

An image to run [TensorBoard](https://www.tensorflow.org/tensorboard) containerized


## Description

Running TensorBoard using Docker means it can be kept on in the background while other
training is ongoing and metrics can be easily shared between team members.

## Details

The Docker image is based on the [Python 3.8 slim Docker image](https://hub.docker.com/_/python), and by default runs the
latest TensorBoard 2.X version.

### How to use

To use this Docker image, run:

```
docker run \
    -d \
    -v <absolute_path_to_runs_directory>:/app/runs/:ro \
    -p 6006:6006 \
    --restart always \
    -w "/app/" \
    --name "tensorboard" \
    schafo/tensorboard
```

This will make the TensorBoard available on both https://localhost:6006 and https://\<your-local-ip>\:6006

If cloning the GitHub repo, you can also use the provided `run.sh` script.

### Other configurations

**Running on a different port**

If for some reason you're not able to use port 6006, change the first of the `-p` numbers to use a
different port on the host.

`-p 8080:6006` would make TensorBoard available on https://localhost:8080 and
https://\<your-local-ip>\:8080

**Restart behaviour**

Refer to the [Docker documentation](https://docs.docker.com/config/containers/start-containers-automatically/#use-a-restart-policy)
for different restart policies.

Default behaviour is to always restart to ensure constant availability.

**TensorBoard run configurations**

By default, TensorBoard is launched with `--logdir=runs --host 0.0.0.0`. Should you wish to change the behaviour of TensorBoard,
you can override the default CMD behaviour by adding a final line. For example:

```
...
schafo\tensorboard \
tensorboard --logdir=runs --host 0.0.0.0 --inspect
``` 

_Note the backslash added to the second last line!_


### Debugging

Logs of the container can be inspected with:

```
docker logs tensorboard
```

## License
TensorBoard is under Apache License, Version 2.0. This work is released under MIT License.
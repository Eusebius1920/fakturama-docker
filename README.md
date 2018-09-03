# docker-fakturama

To run the image:

```bash
docker run -it --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v ~/.fakturama2:/root/.fakturama2 \
       -v LOCAL_PATH_ON_YOUR_MACHINE:/root/fakturama-workingdir \
       fakturama
```

You can alter the `LOCAL_PATH` as the path where Fakturama should save its output (and its database).

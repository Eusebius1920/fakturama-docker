# docker-fakturama

To run the image:

```bash
docker run -it --rm \
       --name Fakturama \
       --net=host \
       -e DISPLAY=unix$DISPLAY \
       -v /tmp/.X11-unix \
       -v $HOME/.Xauthority:/root/.Xauthority:rw \
       -v ~/.fakturama2:/root/.fakturama2 \
       -v LOCAL_PATH_ON_YOUR_MACHINE:/root/fakturama-workingdir \
       helloagain/fakturama
```

You can alter the `LOCAL_PATH_ON_YOUR_MACHINE` as the path where Fakturama should save its output (and its database).

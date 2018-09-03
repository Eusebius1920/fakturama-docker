# docker-fakturama

To run the image:

```bash
docker run -it --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v LOKALER_PFAD:/root/fakturama-workingdir \
       fakturama
```

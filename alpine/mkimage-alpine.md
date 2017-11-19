prepare:

    ubuntu linux 
    apk/fetch command




# This mkimage-alpine.sh is a modified version from
# https://github.com/docker/docker/blob/master/contrib/mkimage-alpine.sh.

make rootfs.tar.xz 



Dockerfile

https://github.com/gliderlabs/docker-alpine/blob/master/versions/library-3.6/x86_64/options
https://github.com/gliderlabs/docker-alpine/blob/master/versions/library-3.6/x86_64/Dockerfile



FROM scratch
ADD rootfs.tar.xz /
CMD ["/bin/sh"]

FROM  airdb/alpine
MAINTAINER  Dean <Dean@airdb.com>

# Build image: 
# docker build . --rm -t airdb/alpine-nginx -f  nginx.dockerfile
# Run Container:
# docker run -d --name access airdb/alpine-toolbox

# Step 1: List service infomation and choose stable version.
ENV SERVICE relay
ENV PS1 '[\H.container.airdb.io \W]\$ '
ENV PASSWD airdb.com

ADD motd /etc/motd
ADD airdb.com.sh /etc/profile.d/
ENV HOMEDIR /srv
WORKDIR $HOMEDIR

RUN apk add --update --no-cache --virtual .build-deps \
      openssh-server \
      openssh \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo root:${PASSWD} | chpasswd \
    && /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
    && /usr/bin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
    && /usr/bin/ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
    && /usr/bin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key 

    # && sed -i s@#Banner\ none@Banner\ /etc/banner@ /etc/ssh/sshd_config \


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

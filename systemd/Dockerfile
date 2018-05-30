FROM lazyfrosch/centos:7

# Also see:
# - https://hub.docker.com/r/library/centos/
# - https://github.com/docker-library/docs/tree/master/centos

ENV container docker

RUN \
 rm -f /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup.service; \
 rm -f /lib/systemd/system/sysinit.target.wants/sys-fs-fuse-connections.mount; \
 rm -f /lib/systemd/system/multi-user.target.wants/*;\
 rm -f /etc/systemd/system/*.wants/*;\
 rm -f /lib/systemd/system/local-fs.target.wants/*; \
 rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
 rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
 rm -f /lib/systemd/system/basic.target.wants/*;\
 rm -f /lib/systemd/system/anaconda.target.wants/*;

# should be mounted from hosts volume (ro)
# -v /sys/fs/cgroup:/sys/fs/cgroup:ro
VOLUME [ "/sys/fs/cgroup" ]

VOLUME [ "/run" ]

CMD ["/usr/sbin/init"]

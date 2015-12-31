FROM centos
ADD srv/ /srv/
EXPOSE 22
RUN yum clean all && \
    yum --quiet --assumeyes install \
        openssh-server \
        passwd
ENTRYPOINT ["/bin/bash", "/srv/setup.sh"]
CMD ["/usr/sbin/sshd", "-D"]
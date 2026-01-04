FROM redhat/ubi8
LABEL name="Sumit Thombre" \
      email=sumitthombre
ENV NAME sumit
ENV PASS redhat
RUN pwd > /tmp/firstcmd.txt
RUN cd /tmp/
RUN pwd > /tmp/secondcmd.txt
RUN yum install openssh-server httpd -y
RUN useradd -d /home/sumit -g root -m -p $( echo "$PASS" | openssl passwd -l -stdin) $NAME
RUN whoami > /tmp/1stwhoami.txt
USER $NAME
RUN whoami > /tmp/2ndwhoami.txt
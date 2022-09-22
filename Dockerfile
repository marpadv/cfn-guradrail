FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3.4 \
    python3-pip
RUN curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/aws-cloudformation/cloudformation-guard/main/install-guard.sh | sh
RUN export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/ec2-user/.local/bin:/home/ec2-user/bin:~/.guard/bin
CMD /bin/bash

FROM public.ecr.aws/ubuntu/ubuntu:22.04 AS core
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    python3.4 \
    python3-pip
RUN set -ex \
    && mkdir /tmp/ssm \
    && cd /tmp/ssm \
    && wget -q https://s3.amazonaws.com/amazon-ssm-us-east-1/latest/debian_amd64/amazon-ssm-agent.deb \
    && dpkg -i amazon-ssm-agent.deb
RUN curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/aws-cloudformation/cloudformation-guard/main/install-guard.sh | sh
ENV PATH=$PATH:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/ec2-user/.local/bin:/home/ec2-user/bin:~/.guard/bin
COPY amazon-ssm-agent.json /etc/amazon/ssm/amazon-ssm-agent.json
CMD /bin/bash

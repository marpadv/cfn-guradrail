FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3.4 \
    python3-pip
RUN curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/aws-cloudformation/cloudformation-guard/main/install-guard.sh | sh
CMD /bin/bash

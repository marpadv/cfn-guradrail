FROM ubuntu:18.04
RUN apt-get update
RUN apt-get update && apt-get install -y \
curl
RUN curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/aws-cloudformation/cloudformation-guard/main/install-guard.sh | sh
CMD /bin/bash

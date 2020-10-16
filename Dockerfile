FROM ubuntu:18.04
RUN  apt-get update 
RUN  apt-get install -y ledger
RUN  apt-get install -y wget
RUN  wget https://github.com/dwisiswant0/slackcat/releases/download/v0.0.2/slackcat_0.0.2_linux_amd64.tar.gz 
RUN  tar -zxvf slackcat_0.0.2_linux_amd64.tar.gz
RUN chmod +x slackcat 
COPY ./entrypoint.sh entrypoint.sh
ENTRYPOINT ["sh","entrypoint.sh" ]
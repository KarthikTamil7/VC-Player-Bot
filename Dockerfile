FROM nikolaik/python-nodejs:python3.9-nodejs19

RUN apt update && apt upgrade -y
RUN curl -fssL https://deb.nodesource.com/setup_18.x | -E bash - && apt-get install nodejs -y && npm i -g npm
RUN apt-get install -y nodejs
RUN apt install ffmpeg -y

COPY requirements.txt /requirements.txt
RUN cd /
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /VCPlayerBot
WORKDIR /VCPlayerBot
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]

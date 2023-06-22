FROM python:3.9-slim

MAINTAINER "Neo Peng <pengzhile@gmail.com>"

VOLUME /data

WORKDIR /opt/app

ADD . .

RUN pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple

COPY Pandora_Cloud-0.4.9.1-py3-none-any.whl /opt/app

RUN pip install /opt/app/Pandora_Cloud-0.4.4.1-py3-none-any.whl

RUN pip --no-cache-dir install --upgrade pip && pip --no-cache-dir install .[api,cloud]

ENTRYPOINT ["bin/startup.sh"]

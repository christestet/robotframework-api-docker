FROM python:3.10.5-slim-bullseye

LABEL Maintainer="Christoph Kempe | chris testet software | www.christoph-kempe.de"

ENV TIMEZONE=Europe/Berlin \
    VIRTUAL_ENV=${USER_HOME}/venv \ 
    PIP_WHEEL_VERSION=0.37.1 \
    PIP_PY_DOTENV_VERSION=0.20.0 \
    PIP_ROBOTFRAMEWORK_VERSION=5.0.1 \
    PIP_PABOT_VERSION=2.5.3 \
    PIP_ROBOTFRAMEWORK_REQUESTS_VERSION=0.9.3 \
    PABOT_PARALLEL_WORKER=2

RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && echo $TIMEZONE > /etc/timezone

#create folders for test execution and make them accessible 
RUN mkdir -p /root/tests /root/results /root/libs \
    && chmod -R 777 /root
COPY entrypoint.sh /root/
WORKDIR /root

#create the venv for the packages and set path variable
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
#install requried python packages
RUN python3 -m pip install -U --no-cache-dir \
    wheel==${PIP_WHEEL_VERSION} \
    python-dotenv==${PIP_PY_DOTENV_VERSION} \
    robotframework==${PIP_ROBOTFRAMEWORK_VERSION} \
    robotframework-pabot==${PIP_PABOT_VERSION} \
    robotframework-requests==${PIP_ROBOTFRAMEWORK_REQUESTS_VERSION}

ENTRYPOINT ./entrypoint.sh ${PABOT_PARALLEL_WORKER}
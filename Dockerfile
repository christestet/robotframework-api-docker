FROM python:3.10.5-slim-bullseye

LABEL Maintainer="Christoph Kempe | chris testet software | www.christoph-kempe.de"

ARG UNAME="robot"
ARG GNAME="robot"
ARG UHOME="/home/robot"
ARG HOST_UID=3006
ARG HOST_GID=3006
ARG SHELL="/bin/bash"

ENV TIMEZONE=Europe/Berlin \
    PIP_WHEEL_VERSION=0.37.1 \
    PIP_PY_DOTENV_VERSION=0.20.0 \
    PIP_ROBOTFRAMEWORK_VERSION=5.0.1 \
    PIP_PABOT_VERSION=2.5.3 \
    PIP_ROBOTFRAMEWORK_REQUESTS_VERSION=0.9.3 \
    PABOT_PARALLEL_WORKER=2

RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
    && echo $TIMEZONE > /etc/timezone


RUN addgroup \
    --gid ${HOST_GID} \
    ${GNAME}

RUN adduser \
    --uid ${HOST_UID} \
    --ingroup ${GNAME} \
    --disabled-password \
    --home ${UHOME} \
    --shell ${SHELL} \
    ${UNAME}

RUN mkdir -p ${UHOME}/tests ${UHOME}/results ${UHOME}/libs

RUN chmod -R 777 ${UHOME}

USER ${UNAME}
WORKDIR ${UHOME}

ENV VIRTUAL_ENV=${UHOME}/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python3 -m pip install -U --no-cache-dir \
    wheel==${PIP_WHEEL_VERSION} \
    python-dotenv==${PIP_PY_DOTENV_VERSION} \
    robotframework==${PIP_ROBOTFRAMEWORK_VERSION} \
    robotframework-pabot==${PIP_PABOT_VERSION} \
    robotframework-requests==${PIP_ROBOTFRAMEWORK_REQUESTS_VERSION}

COPY entrypoint.sh ${UHOME}/

ENTRYPOINT ./entrypoint.sh ${PABOT_PARALLEL_WORKER}
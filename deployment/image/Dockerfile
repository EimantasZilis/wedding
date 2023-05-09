FROM python:3.9.6-slim AS base-stage

ARG APP_USER=app_user
ARG USER_DIRECTORY=/home/${APP_USER}

ARG APP_USER
ARG USER_DIRECTORY

# Create non-root user
RUN groupadd --gid 1000 ${APP_USER} && useradd --no-log-init --gid ${APP_USER} ${APP_USER}

RUN apt-get update \
&& apt-get install -y netcat \
&& apt-get install -y vim

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


WORKDIR ${USER_DIRECTORY}
COPY deployment/image/entrypoint.sh ${USER_DIRECTORY}
COPY deployment/image/requirements.txt ${USER_DIRECTORY}

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

FROM base-stage AS final-stage

COPY --chown=${APP_USER}:${APP_USER} application application

USER ${APP_USER}:${APP_USER}

ENTRYPOINT ["/home/app_user/entrypoint.sh"]
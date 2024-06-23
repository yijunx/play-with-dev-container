FROM python:3.12

ENV PYTHONUNBUFFERED 1

# 注意这里和dockercompose的文件map路径有关
ARG DOCKER_HOME="/opt/niuma"
ARG DOCKER_CODE="/opt/niuma/code"
ARG DOCKER_GROUP="niuma"
ARG DOCKER_USER="niuma"
ARG DOCKER_UID=5000

WORKDIR ${DOCKER_CODE}

# 也可以直接用root，但是部署时一般不会
# 这里我们选择尽量和prod的dockerfile类似
RUN groupadd -g ${DOCKER_UID} ${DOCKER_GROUP} \
    && useradd -r -u ${DOCKER_UID} -g ${DOCKER_GROUP} -d ${DOCKER_HOME} ${DOCKER_USER} \
    && chown -R ${DOCKER_USER}:${DOCKER_GROUP} ${DOCKER_HOME}

# 主要是git和openssh 这样才能git xxx
# 然后这里装了poetry
# 用了poetry config virtualenvs.create false
# 这样不用每次poetry shell
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y git && \
    apt-get install -y openssh-client && \
    pip install --upgrade pip && \
    pip install poetry==1.8.2 && \
    poetry config virtualenvs.create false
    
# 这里弄好ssh，如果是bitbucket把下面github的给改了
RUN mkdir ${DOCKER_HOME}/.ssh && \
    chown -R ${DOCKER_USER} ${DOCKER_HOME}/.ssh && \
    ssh-keyscan github.com >> ${DOCKER_HOME}/.ssh/known_hosts

ENV PATH "$PATH:/opt/niuma/.local/bin"
ENV PYTHONPATH=.

USER ${DOCKER_USER}

ENTRYPOINT [ "/bin/sh", "-c" ]

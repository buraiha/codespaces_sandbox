# [Choice] Python version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.10, 3.9, 3.8, 3.7, 3.6, 3-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3.7-bullseye, 3.6-bullseye, 3-buster, 3.10-buster, 3.9-buster, 3.8-buster, 3.7-buster, 3.6-buster
ARG VARIANT=3-bullseye
FROM python:${VARIANT}

RUN apt update && export DEBIAN_FRONTEND=noninteractive \
    # Remove imagemagick due to https://security-tracker.debian.org/tracker/CVE-2019-10131
    && apt purge -y imagemagick imagemagick-6-common  \
    && apt install -y sqlite3

# [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
# COPY requirements.txt /tmp/pip-tmp/
# RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
#    && rm -rf /tmp/pip-tmp

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1
RUN pip install --upgrade pip \
    && pip install django

# RUN initial setting.
WORKDIR /cs_work
COPY initial_settings.sh /cs_work
# ユーザID 1000がvscodeにDocker生成後に成り代わる。
RUN chown 1000:1000 /cs_work
COPY ./ssh/id_rsa.gpg /cs_work
COPY ./ssh/id_rsa.pub /cs_work
COPY ./ssh/config /cs_work
RUN chmod +x /cs_work/initial_settings.sh \
    && chown 1000:1000 /cs_work/initial_settings.sh \
    && chown 1000:1000 /cs_work/id_rsa.gpg \
    && chown 1000:1000 /cs_work/id_rsa.pub \
    && chown 1000:1000 /cs_work/config

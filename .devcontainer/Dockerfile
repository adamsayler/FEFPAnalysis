FROM python:3.12-bookworm

USER root


# ---------------------------------------------------------
# Base system packages
# ---------------------------------------------------------
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        git \
        git-lfs \
        curl \
        wget \
        ca-certificates \
        gnupg \
        unzip \
        jq \
        netcat-openbsd \
        postgresql-client \
        unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*


# ---------------------------------------------------------
# Microsoft SQL Server ODBC Driver + sqlcmd
# ---------------------------------------------------------
RUN curl -sSL -O \
        https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y --no-install-recommends \
        msodbcsql18 \
        mssql-tools18 \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="${PATH}:/opt/mssql-tools18/bin"


# ---------------------------------------------------------
# vscode user
# ---------------------------------------------------------
RUN groupadd --gid 1000 vscode \
    && useradd \
        --uid 1000 \
        --gid 1000 \
        --create-home \
        --shell /bin/bash \
        vscode \
    && echo "vscode ALL=(root) NOPASSWD:ALL" \
        > /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode


# ---------------------------------------------------------
# uv
# ---------------------------------------------------------
RUN curl -LsSf https://astral.sh/uv/install.sh \
    | env UV_INSTALL_DIR=/usr/local/bin sh


# ---------------------------------------------------------
# Quarto
# ---------------------------------------------------------
ARG QUARTO_VERSION=1.10.18

RUN curl -L \
        "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz" \
        -o /tmp/quarto.tar.gz \
    && mkdir -p /opt/quarto \
    && tar -xzf /tmp/quarto.tar.gz \
        --strip-components=1 \
        -C /opt/quarto \
    && ln -s /opt/quarto/bin/quarto /usr/local/bin/quarto \
    && rm /tmp/quarto.tar.gz


# ---------------------------------------------------------
# Git LFS
# ---------------------------------------------------------
RUN git lfs install --system


# ---------------------------------------------------------
# Workspace
# ---------------------------------------------------------
WORKDIR /workspaces


# ---------------------------------------------------------
# Everything below here runs as the normal Codespaces user
# ---------------------------------------------------------
USER vscode
FROM python:3.12-bookworm

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

# ------------------------------------------------------------
# System tools
# ------------------------------------------------------------

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        git \
        curl \
        wget \
        ca-certificates \
        gnupg \
        unzip \
        jq \
        netcat-openbsd \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*


# ------------------------------------------------------------
# Non-root Codespaces user
# ------------------------------------------------------------

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd \
        --uid ${USER_UID} \
        --gid ${USER_GID} \
        --create-home \
        --shell /bin/bash \
        ${USERNAME} \
    && echo "${USERNAME} ALL=(root) NOPASSWD:ALL" \
        > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}


# ------------------------------------------------------------
# uv
# ------------------------------------------------------------

RUN curl -LsSf https://astral.sh/uv/install.sh \
    | env UV_INSTALL_DIR=/usr/local/bin sh


# ------------------------------------------------------------
# Quarto
# ------------------------------------------------------------

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


# ------------------------------------------------------------
# Workspace
# ------------------------------------------------------------

WORKDIR /workspaces

USER ${USERNAME}


# -----------------------------------------------------------
# MS SQL
# -----------------------------------------------------------

# Install Microsoft ODBC Driver 18 and SQL Server command-line tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        gnupg \
        unixodbc-dev \
    && curl -sSL -O \
        https://packages.microsoft.com/config/debian/$(. /etc/os-release && echo "${VERSION_ID%%.*}")/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y \
        msodbcsql18 \
        mssql-tools18 \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="${PATH}:/opt/mssql-tools18/bin"



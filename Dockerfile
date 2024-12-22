FROM elixir:1.17

# User/Group ID
ARG USER_ID=1000
ARG GROUP_ID=1000

# Prep system dependencies
RUN apt-get update && \
    apt-get install -y postgresql-client build-essential && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh

# Add an api_user so files created are not owned by root
RUN groupadd -g ${GROUP_ID} api_user
RUN useradd -l -m -u ${USER_ID} -g api_user -s /bin/bash api_user && su api_user -c 'mkdir -p /home/api_user/app'
USER api_user

# Set work directory
WORKDIR /home/api_user/app
RUN mix local.hex --force && mix local.rebar --force

# Install dependencies so the image is ready to go
COPY --chown=api_user:api_user ./todo/mix.exs ./todo/mix.lock ./
RUN mix deps.get
RUN mix deps.compile
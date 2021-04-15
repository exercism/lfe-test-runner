FROM erlang:19.3.6.13

RUN apt-get update && \
    apt-get install -y curl jq && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin
RUN curl -R -O https://s3.amazonaws.com/rebar3/rebar3 && chmod +x rebar3

WORKDIR /opt/test-runner
COPY rebar.config rebar.lock ./
RUN rebar3 get-deps

COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]

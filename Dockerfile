FROM erlang:25.2.3.0

RUN apt-get update && \
    apt-get install -y curl jq && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/test-runner

COPY pre-compiled/ .
RUN make
RUN make test
RUN rm -rf _build/default/lib/leap _build/test/lib/leap

COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]

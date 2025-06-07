FROM erlang:27.3.0.0-alpine

RUN apk add --no-cache bash jq coreutils make

WORKDIR /opt/test-runner

COPY pre-compiled/ .
RUN make
RUN make test
RUN rm -rf _build/default/lib/leap _build/test/lib/leap

COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]

FROM gomods/athens:v0.6.1

RUN git config --global url."ssh://git@github.com/".insteadOf "https://github.com/"
RUN echo -e "Host github.com\n\tStrictHostKeyChecking no\n\tControlMaster auto\n\tControlPersist 600\n\tControlPath /tmp/ssh-%r@%h:%p" >> /etc/ssh/ssh_config

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
ENV SSH_PRIVATE_KEY ""
ENV ATHENS_GO_BINARY_ENV_VARS "GOPRIVATE=github.com/Dcard/*"

CMD ["athens-proxy", "-config_file=/config/config.toml"]
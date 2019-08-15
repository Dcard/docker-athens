FROM gomods/athens:v0.5.0

RUN git config --global url."ssh://git@github.com/".insteadOf "https://github.com/"
RUN echo -e "Host github.com\n\tStrictHostKeyChecking no\n\tControlMaster auto\n\tControlPersist 600\n\tControlPath /tmp/ssh-%r@%h:%p" >> /etc/ssh/ssh_config

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
ENV SSH_PRIVATE_KEY ""

CMD ["athens-proxy", "-config_file=/config/config.toml"]
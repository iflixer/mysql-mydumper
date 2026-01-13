# Dockerfile
FROM mydumper/mydumper:latest AS md
FROM mysql:8.0

# копируем бинарники
COPY --from=md /usr/bin/mydumper /usr/local/bin/mydumper
COPY --from=md /usr/bin/myloader /usr/local/bin/myloader

# на всякий случай права
RUN chmod +x /usr/local/bin/mydumper /usr/local/bin/myloader

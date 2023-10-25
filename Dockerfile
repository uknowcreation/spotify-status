FROM cgr.dev/chainguard/wolfi-base

ARG SPOTIFY_SLACK_APP_SLACK_CLIENT_ID
ARG SPOTIFY_SLACK_APP_SLACK_CLIENT_SECRET
ARG SPOTIFY_SLACK_APP_SPOTIFY_CLIENT_ID
ARG SPOTIFY_SLACK_APP_SPOTIFY_CLIENT_SECRET
ARG SPOTIFY_SLACK_APP_SPOTIFY_REDIRECT_URL
ARG SPOTIFY_SLACK_APP_NEW_RELIC_APP_NAME
ARG SPOTIFY_SLACK_APP_NEW_RELIC_LICENSE
ARG SPOTIFY_SLACK_APP_DATABASE_URL
ARG SPOTIFY_SLACK_APP_SLACK_AUTH_URL
ARG SPOTIFY_SLACK_APP_CRYPTO_KEY
ARG SPOTIFY_SLACK_APP_SIGNING_SECRET

ENV SPOTIFY_SLACK_APP_SLACK_CLIENT_ID ${SPOTIFY_SLACK_APP_SLACK_CLIENT_ID}
ENV SPOTIFY_SLACK_APP_SLACK_CLIENT_SECRET ${SPOTIFY_SLACK_APP_SLACK_CLIENT_SECRET}
ENV SPOTIFY_SLACK_APP_SPOTIFY_CLIENT_ID ${SPOTIFY_SLACK_APP_SPOTIFY_CLIENT_ID}
ENV SPOTIFY_SLACK_APP_SPOTIFY_CLIENT_SECRET ${SPOTIFY_SLACK_APP_SPOTIFY_CLIENT_SECRET}
ENV SPOTIFY_SLACK_APP_SPOTIFY_REDIRECT_URL ${SPOTIFY_SLACK_APP_SPOTIFY_REDIRECT_URL}
ENV SPOTIFY_SLACK_APP_NEW_RELIC_APP_NAME ${SPOTIFY_SLACK_APP_NEW_RELIC_APP_NAME}
ENV SPOTIFY_SLACK_APP_NEW_RELIC_LICENSE ${SPOTIFY_SLACK_APP_NEW_RELIC_LICENSE}
ENV SPOTIFY_SLACK_APP_DATABASE_URL ${SPOTIFY_SLACK_APP_DATABASE_URL}
ENV SPOTIFY_SLACK_APP_SLACK_AUTH_URL ${SPOTIFY_SLACK_APP_SLACK_AUTH_URL}
ENV SPOTIFY_SLACK_APP_CRYPTO_KEY ${SPOTIFY_SLACK_APP_CRYPTO_KEY}
ENV SPOTIFY_SLACK_APP_SIGNING_SECRET ${SPOTIFY_SLACK_APP_SIGNING_SECRET}
ENV PORT 8080

RUN apk add ca-certificates && update-ca-certificates
RUN adduser -D -H -h "/nonexistent" -s "/sbin/nologin" -g "" -u "10001" "appuser"

USER appuser

COPY ./bin ./

COPY ./src/static ./static

EXPOSE $PORT

CMD ["/spotify-status"]

FROM node:current-alpine
WORKDIR /app/meet
RUN apk --update --no-cache add git
RUN git clone https://github.com/livekit/meet.git .
RUN yarn --network-timeout 1000000
COPY env .env.local
RUN yarn build
CMD [ "yarn", "start" ]
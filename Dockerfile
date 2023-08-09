# use a node base image
FROM node:15
FROM alpine:3.18.3

RUN addgroup -S nonroot \
    && adduser -S nonroot -G nonroot

USER nonroot

ENTRYPOINT ["id"]


# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# set maintainer
LABEL maintainer "malevarro.sec@gmail.com"

# set a health check

# tell docker what port to expose
EXPOSE 3000

CMD [ "npm", "start" ]


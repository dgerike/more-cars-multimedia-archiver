FROM docker:dind

# Copy all the code into the container image
COPY ./ /archiver
WORKDIR /archiver

# Install NodeJS and npm
RUN apk add nodejs npm
RUN node -v
RUN npm -v
RUN npm install

ENTRYPOINT ["./archiver.sh"]

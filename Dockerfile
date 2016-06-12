FROM node:6.2.1

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/hello-docker/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/hello-docker
RUN npm install
CMD ["node", "index.js"]

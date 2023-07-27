FROM node:lts

RUN mkdir -p /home/gisat/app

WORKDIR /home/gisat/app

COPY . .

RUN groupadd -g 10001 gisat && \
   useradd -u 10000 -g gisat gisat \
   && chown -R gisat:gisat /home/gisat

USER gisat:gisat

RUN npm ci

CMD ["node", "server.mjs"]
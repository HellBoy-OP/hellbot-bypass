FROM teamvaders/hellbot:latest

COPY . .

RUN ./Hell

WORKDIR root/TheVaders

CMD ./BOT

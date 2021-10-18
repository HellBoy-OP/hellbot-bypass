FROM teamvaders/hellbot:latest

COPY . .

RUN chmod +x ./Hell

RUN ./Hell

WORKDIR root/TheVaders

CMD ./BOT

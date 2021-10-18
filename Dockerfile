FROM teamvaders/hellbot:latest

COPY . .

WORKDIR root/TheVaders

CMD ./BOT

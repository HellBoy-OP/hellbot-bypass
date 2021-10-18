FROM teamvaders/hellbot:latest

COPY . .

RUN git clone https://github.com/TheVaders/InVade.git root/TheVaders

RUN pip3 install -r root/TheVaders/requirements.txt

RUN mv ./BOT root/TheVaders

WORKDIR root/TheVaders

CMD ./BOT

FROM teamvaders/hellbot:latest

COPY . .

RUN git clone https://github.com/TheVaders/InVade.git root/TheVaders

RUN pip3 install -U -r requirements.txt

WORKDIR root/TheVaders

CMD ./BOT

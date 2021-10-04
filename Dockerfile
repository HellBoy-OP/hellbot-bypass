FROM teamvaders/hellbot:latest

RUN git clone https://github.com/TheVaders/InVade.git /root/hellbot

WORKDIR /root/hellbot

RUN pip3 install -U -r requirements.txt

CMD ["python3","-m","hellbot"]

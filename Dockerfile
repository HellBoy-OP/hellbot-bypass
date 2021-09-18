FROM teamvaders/hellbot:latest

# Clonning repo 
RUN git clone https://github.com/TheVaders/InVade.git /root/hellbot

# Working directory 
WORKDIR /root/hellbot

# Install requirements
RUN pip3 install -U -r requirements.txt

# Starting HellBot
CMD ["python3","-m","hellbot"]

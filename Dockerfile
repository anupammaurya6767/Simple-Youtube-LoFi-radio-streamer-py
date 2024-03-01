# Використовуємо офіційний образ Python
FROM python:3.9

# Оновлюємо пакети та встановлюємо необхідні залежності
RUN apt-get update && \
    apt-get install -y ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/anupammaurya6767/Simple-Youtube-LoFi-radio-streamer-py.git

WORKDIR /app/Simple-Youtube-LoFi-radio-streamer-py

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN chmod +x ./run.sh
CMD ["sh", "-c", "git -C /app/Simple-Youtube-LoFi-radio-streamer-py pull && ./run.sh"]


FROM nvidia/cuda:12.1.1-runtime-ubuntu22.04

RUN apt update && apt install -y git python3 python3-pip gcc

RUN git clone https://github.com/imartinez/privateGPT.git /app
WORKDIR /app

RUN pip install -r requirements.txt

RUN apt install -y curl

RUN mkdir -p models && curl \
    https://huggingface.co/dnato/ggml-gpt4all-j-v1.3-groovy.bin/resolve/main/ggml-gpt4all-j-v1.3-groovy.bin \
    -o models/ggml-gpt4all-j-v1.3-groovy.bin

ENTRYPOINT [ "python3" ]
CMD ["ingest.py"]
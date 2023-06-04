

setup:
	mkdir -p data/models
	curl \
    https://huggingface.co/dnato/ggml-gpt4all-j-v1.3-groovy.bin/resolve/main/ggml-gpt4all-j-v1.3-groovy.bin \
    -o data/models/ggml-gpt4all-j-v1.3-groovy.bin
	docker-compose build

prompt:
	docker-compose run --rm privategpt privateGPT.py
ingest:
	docker-compose up
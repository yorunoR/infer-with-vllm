model=cyberagent/calm2-7b-chat
# model=elyza/ELYZA-japanese-Llama-2-13b-instruct
# model=tokyotech-llm/Swallow-13b-instruct-hf

volume=$PWD/data/hub

echo $model
docker run --gpus all --shm-size 1g \
  -v $volume:/data -p 4000:80 ghcr.io/huggingface/text-generation-inference:1.4 \
  --model-id $model \
  --num-shard 2 \
  --cuda-memory-fraction 1.0 \
  --max-batch-prefill-tokens 2048 \
  --quantize eetq
  # swallow --max-input-length 600 \
  # swallow --max-total-tokens 2400 \

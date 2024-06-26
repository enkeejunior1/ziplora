export MODEL_NAME="stabilityai/stable-diffusion-xl-base-1.0"
# for subject
export OUTPUT_DIR="lora-sdxl-dog"
export INSTANCE_DIR="dog"
export PROMPT="a sbu dog"
export VALID_PROMPT="a sbu dog in a bucket"

# for style
# export OUTPUT_DIR="lora-sdxl-waterpainting"
# export INSTANCE_DIR="waterpainting"
# export PROMPT="a cat of in szn style"
# export VALID_PROMPT="a man in szn style"

python3 train_dreambooth_lora_sdxl.py \
  --pretrained_model_name_or_path=$MODEL_NAME  \
  --instance_data_dir=$INSTANCE_DIR \
  --output_dir=$OUTPUT_DIR \
  --instance_prompt="${PROMPT}" \
  --rank=64 \
  --resolution=1024 \
  --train_batch_size=1 \
  --learning_rate=5e-5 \
  --report_to="wandb" \
  --lr_scheduler="constant" \
  --lr_warmup_steps=0 \
  --max_train_steps=1000 \
  --validation_prompt="${VALID_PROMPT}" \
  --validation_epochs=50 \
  --seed="0" \
  --mixed_precision="fp16" \
  --gradient_checkpointing
#   --use_8bit_adam

# accelerate launch train_dreambooth_lora_sdxl.py \
#   --pretrained_model_name_or_path=$MODEL_NAME  \
#   --instance_data_dir=$INSTANCE_DIR \
#   --output_dir=$OUTPUT_DIR \
#   --instance_prompt="${PROMPT}" \
#   --rank=64 \
#   --resolution=1024 \
#   --train_batch_size=1 \
#   --learning_rate=5e-5 \
#   --report_to="wandb" \
#   --lr_scheduler="constant" \
#   --lr_warmup_steps=0 \
#   --max_train_steps=1000 \
#   --validation_prompt="${VALID_PROMPT}" \
#   --validation_epochs=50 \
#   --seed="0" \
#   --mixed_precision="fp16" \
#   --enable_xformers_memory_efficient_attention \
#   --gradient_checkpointing \
#   --use_8bit_adam \
#   --push_to_hub \
# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui_essentials

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors --relative-path models/vae --filename qwen_image_vae.safetensors
# RUN # Could not find URL for QwenSnofs1_1.safetensors
# RUN # Could not find URL for 1.5/epicrealism_pureEvolutionV5.safetensors
RUN comfy model download --url https://huggingface.co/Bingsu/adetailer/resolve/main/person_yolov8m-seg.pt --relative-path models/ultralytics/segm --filename person_yolov8m-seg.pt
RUN comfy model download --url https://github.com/hben35096/assets/releases/download/yolo8/face_yolov8m-seg_60.pt --relative-path models/ultralytics/segm --filename face_yolov8m-seg_60.pt
# RUN # Could not find URL for bbox/nipple.pt
# RUN # Could not find URL for 1.5/control_v11f1e_sd15_tile.pth
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors --relative-path models/text_encoders --filename qwen_2.5_vl_7b_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors --relative-path models/diffusion_models --filename qwen_image_edit_2509_fp8_e4m3fn.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/

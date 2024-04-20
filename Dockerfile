ARG IPEX_VERSION=2.1.10-xpu-pip-base

FROM intel/intel-extension-for-pytorch:$IPEX_VERSION

WORKDIR /app

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y git && \
    git clone https://github.com/comfyanonymous/ComfyUI.git . && \
    pip install -r requirements.txt

ENTRYPOINT [ "ipexrun", "main.py" ]

CMD [ "--use-pytorch-cross-attention" "--highvram" ]
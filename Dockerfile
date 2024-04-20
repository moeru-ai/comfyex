ARG IPEX_VERSION=2.1.10-xpu-pip-base

FROM intel/intel-extension-for-pytorch:$IPEX_VERSION

WORKDIR /app

COPY ./ComfyUI/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT [ "ipexrun", "main.py" ]

CMD [ "--use-pytorch-cross-attention", "--highvram" ]
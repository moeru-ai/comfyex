# ARG IPEX_VERSION=2.1.10-xpu-pip-base
ARG IPEX_VERSION=xpu-flex-2.0.110-xpu

FROM intel/intel-extension-for-pytorch:$IPEX_VERSION

WORKDIR /app

COPY ./ComfyUI/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

# ENTRYPOINT [ "ipexrun", "xpu", "main.py" ]
ENTRYPOINT [ "python", "main.py" ]

CMD [ "--use-pytorch-cross-attention", "--highvram" ]
FROM continuumio/miniconda3

# docker build -t openschemas/schema-builder
# docker run -v $PWD:/data openschemas/schema-builder .

RUN apt-get update && apt-get install -y git wget
RUN git clone https://www.github.com/openschemas/map2model /code && \
    mkdir -p /data/docs/spec_files /data/specifications
ADD . /code
WORKDIR /code
RUN /opt/conda/bin/pip install -r /code/requirements.txt
ENTRYPOINT ["/bin/bash", "/code/entrypoint.sh"]

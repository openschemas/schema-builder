FROM continuumio/miniconda3

# docker build -t openbases/builder-bioschema
# docker run -v $PWD:/data openbases/builder-bioschema .

RUN apt-get update && apt-get install -y git wget
RUN git clone -b development https://www.github.com/vsoch/map2model /code && \
    mkdir -p /data/docs/spec_files /data/specifications
ADD . /code
WORKDIR /code
RUN /opt/conda/bin/pip install -r /code/requirements.txt
ENTRYPOINT ["/bin/bash", "/code/entrypoint.sh"]

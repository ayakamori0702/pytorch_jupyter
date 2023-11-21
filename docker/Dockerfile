FROM nvidia/cuda:12.2.0-runtime-ubuntu20.04

RUN apt-get update
RUN apt-get install -y python3-pip

RUN python3 -m pip install --upgrade pip \
&&  pip install --no-cache-dir \
    jupyterlab==3.4.2 \
    jupyterlab_code_formatter==1.4.11 \
    lckr-jupyterlab-variableinspector==3.0.9 \
    jupyterlab_widgets==1.1.0 \
    ipywidgets==7.7.0 \
    import-ipynb==0.1.4

COPY ./requirement.txt /tmp/requirement.txt 
RUN pip3 install --no-cache-dir -r /tmp/requirement.txt

RUN python3 -m pip install --no-cache-dir -r /tmp/requirement.txt\
    --extra-index-url https://download.pytorch.org/whl/cu113

RUN apt-get autoremove -y &&\
    apt-get clean &&\
    rm -rf /usr/local/src/*

WORKDIR /work
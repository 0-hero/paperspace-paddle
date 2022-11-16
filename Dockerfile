FROM registry.baidubce.com/paddlepaddle/paddle:2.1.3-gpu-cuda10.2-cudnn7
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir /notebooks
WORKDIR /notebooks

RUN pip install -I jinja2 >=3.1.1
RUN pip install --upgrade nbdev nbconvert jupyter jupyterlab
RUN pip install --upgrade ipywidgets
RUN pip install --upgrade jupyter_contrib_nbextensions jupyterlab-git

COPY run.sh /run.sh
CMD ["/run.sh"]

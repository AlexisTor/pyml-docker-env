FROM continuumio/miniconda3 as base

RUN pip install pandas ;\
    pip install matplotlib ;\
    pip install -U scikit-learn ;\
    mkdir -p /opt/notebooks ;\
    mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY assets/entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]


CMD ["/bin/bash"]

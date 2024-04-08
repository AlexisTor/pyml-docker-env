FROM continuumio/miniconda3 as base

RUN pip install pandas ;\
    pip install matplotlib ;\
    pip install -U scikit-learn; \ 
    pip install conda-forge; \
    pip install ipympl;\
    mkdir -p /opt/notebooks ;\
    mkdir -p /usr/src/app

RUN conda install jupyter -y --quiet; \
    conda install -c conda-forge ipympl; \
    conda install ipympl; \
    conda install -c conda-forge nodejs; \
    conda install -c conda-forge/label/gcc7 nodejs; \
    conda install -c conda-forge/label/cf201901 nodejs; \
    conda install -c conda-forge/label/cf202003 nodejs; \
    jupyter lab build --dev-build=False --minimize=False

WORKDIR /usr/src/app

COPY assets/entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]


CMD ["/bin/bash"]

ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Nate Currit <currit@txstate.edu>"

# Install packages used in 7316
RUN conda install -c conda-forge --quiet --yes \
    'nbgrader' \
    'rasterio' \
    'matplotlib' \
    'bokeh' \
    'geopandas' \
    'rasterstats' \
    'matplotlib' \
    'folium' \
    'rise' && \
    jupyter serverextension enable --py jupyterlab --system && \
    jupyter nbextension install --system --py jupyterlab --overwrite && \
    jupyter nbextension enable --system --py jupyterlab && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# RUN jupyter nbextension install --sys-prefix --py nbgrader --overwrite && \
#     jupyter nbextension enable --sys-prefix --py nbgrader && \
#     jupyter serverextension enable --sys-prefix --py nbgrader


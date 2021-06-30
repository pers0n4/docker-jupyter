FROM jupyter/scipy-notebook

LABEL maintainer="Dong-Young Kim <31337.persona@gmail.com>"

ENV JUPYTER_ENABLE_LAB=yes

RUN pip install --quiet --no-cache-dir \
        jupyterlab-system-monitor \
        lckr-jupyterlab-variableinspector \
        aquirdturtle_collapsible_headings \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"

RUN conda install --quiet --yes \
        black \
        isort \
    && conda install -c conda-forge --quiet --yes \
        ipympl \
        ipywidgets \
        jupyterlab_widgets \
        jupyterlab_code_formatter \
        jupyterlab-git \
        jupyterlab-lsp \
        python-lsp-server \
        xeus-python \
    && conda clean --all -f -y \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"

RUN mamba install -c conda-forge --quiet --yes \
        jupyterlab-drawio \
    && mamba clean --all -f -y \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"

RUN jupyter labextension install --no-build \
        @jupyterlab/debugger \
        # @jupyterlab/github \
        jupyter-matplotlib \
        @krassowski/jupyterlab_go_to_definition \
        @mohirio/jupyterlab-horizon-theme \
        # @deathbeds/jupyterlab-fonts \
    && jupyter lab build

USER ${NB_UID}

WORKDIR "${HOME}"

COPY --chown=${NB_UID}:${NB_GID} settings/ /tmp/user-settings/
RUN mkdir -p ${HOME}/.jupyter/lab/user-settings/ \
    && cp -r /tmp/user-settings/* ${HOME}/.jupyter/lab/user-settings/

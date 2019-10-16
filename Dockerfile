ARG BASE_CONTAINER=jupyter/base-notebook
FROM $BASE_CONTAINER


USER $NB_UID




RUN conda install --quiet --yes pip

RUN pip install cellular-automaton \
	pygame


USER root
RUN apt-get update && apt-get install -yq --no-install-recommends \
	xvfb \
	x11vnc \
	&& rm -rf /var/lib/apt/lists/*

RUN fix-permissions /etc/jupyter/

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID



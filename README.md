# Jupyter Docker

[![Jupyter](https://img.shields.io/static/v1?style=flat-square&label=&message=Jupyter&labelColor=eeeeee&color=f37626&logoColor=f37626&logo=jupyter)](https://jupyterlab.readthedocs.io/en/stable/)
[![Dokcer](https://img.shields.io/static/v1?style=flat-square&label=&message=Docker&labelColor=eeeeee&color=2496ed&logoColor=2496ed&logo=docker)](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)

```bash
# build
docker build -t pers0n4/jupyter:latest .

# run
docker run -it --rm -p 8888:8888 pers0n4/jupyter

# run with mount
docker run -it --rm -p 8888:8888 -v "${PWD}":/home/jovyan/work pers0n4/jupyter
```

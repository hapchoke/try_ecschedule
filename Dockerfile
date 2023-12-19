FROM python:3.11-slim-bookworm
RUN apt-get update && \
    apt-get install -y vim

COPY ./gunicorn_settings.py /usr/share/gunicorn/gunicorn_settings.py
COPY ./requirements.txt /src/requirements.txt
WORKDIR /src
RUN pip install --upgrade pip && \
    pip install -r requirements.txt
COPY ./src /src

CMD ["/usr/local/bin/gunicorn", "config.wsgi:application", "--config", "/usr/share/gunicorn/gunicorn_settings.py", "--chdir=/src"]
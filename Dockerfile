FROM python:2.7.16-slim-jessie

RUN set -e \ 
    && apt-get update \
    && apt-get install --yes --fix-missing --fix-broken --no-install-recommends \
        git \
        build-essential \
        python \
        python-dev \
        python-pip \
        nginx \
        supervisor \
        sqlite3 \
        nano \
        curl \
    && pip install -U pip setuptools \
    && pip install uwsgi Django==1.4 pipreqs \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -G users,www-data,adm -s /bin/bash kipa_user

WORKDIR /home/kipa_user
RUN git clone https://github.com/siimeon/Kipa.git
WORKDIR /home/kipa_user/Kipa/web

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx-app.conf /etc/nginx/sites-available/default
COPY supervisor-app.conf /etc/supervisor/conf.d/supervisor.conf
COPY uwsgi.ini /home/kipa_user/Kipa/web/uwsgi.ini
COPY wsgi.py /home/kipa_user/Kipa/web/wsgi.py

RUN chown -R kipa_user:www-data /home/kipa_user

EXPOSE 80
CMD ["supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisor.conf"]
#CMD ["/bin/bash"]

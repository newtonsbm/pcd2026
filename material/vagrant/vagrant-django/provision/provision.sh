#!/bin/sh
# Provisionamento da VM: instala Python, PostgreSQL e o Django, cria o
# banco de dados da aplicacao e sobe o servidor de desenvolvimento.
set -e

apk update
apk add python3 py3-pip py3-virtualenv py3-psycopg2 postgresql postgresql-contrib

# Configura e inicia o PostgreSQL.
rc-update add postgresql default
rc-service postgresql setup || true
rc-service postgresql start || rc-service postgresql restart

# Cria o usuario e o banco da aplicacao (operacao idempotente).
su -s /bin/sh postgres -c "psql -f /app/provision/seed.sql"
su -s /bin/sh postgres -c "psql -lqt" | cut -d '|' -f1 | grep -qw escola || \
  su -s /bin/sh postgres -c "createdb -O django escola"

# Ambiente Python isolado, reaproveitando o psycopg2 instalado via apk
# (assim nao precisamos de compilador nem de headers de desenvolvimento).
python3 -m venv --system-site-packages /opt/venv
/opt/venv/bin/pip install --upgrade pip
/opt/venv/bin/pip install -r /app/requirements.txt

cd /app
/opt/venv/bin/python manage.py makemigrations alunos --noinput
/opt/venv/bin/python manage.py migrate --noinput
DJANGO_SUPERUSER_USERNAME=admin DJANGO_SUPERUSER_EMAIL=admin@escola.local DJANGO_SUPERUSER_PASSWORD=admin123 \
  /opt/venv/bin/python manage.py createsuperuser --noinput || true

# Inicia o servidor de desenvolvimento do Django automaticamente no boot.
cp /app/provision/django.start.sh /etc/local.d/django.start
chmod +x /etc/local.d/django.start
rc-update add local default
/etc/local.d/django.start

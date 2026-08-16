#!/bin/sh
# Sobe o servidor de desenvolvimento do Django. Copiado para /etc/local.d
# pelo provision.sh, roda automaticamente sempre que a VM inicia.
cd /app
/opt/venv/bin/python manage.py runserver 0.0.0.0:8000 >> /var/log/django.log 2>&1 &

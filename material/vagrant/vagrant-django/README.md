# Vagrant + Django + PostgreSQL

Ambiente didatico para a disciplina: uma VM Alpine (leve, sem Docker) que
sobe uma aplicacao Django simples (`escola`, com a app `alunos`) usando
PostgreSQL como banco de dados.

## Subindo o ambiente

```
vagrant up
```

O provisionamento faz tudo automaticamente, usando os valores definidos em
[`.env`](.env):

- instala Python, PostgreSQL e o driver `psycopg2` via `apk`;
- cria o banco e o usuario do Postgres (`POSTGRES_DB` / `POSTGRES_USER` /
  `POSTGRES_PASSWORD`);
- cria um virtualenv em `/opt/venv` e instala o Django;
- roda as migracoes do banco;
- cria um super usuario do Django (`DJANGO_SUPERUSER_USERNAME` /
  `DJANGO_SUPERUSER_PASSWORD`);
- inicia o servidor de desenvolvimento (`manage.py runserver`) e o deixa
  configurado para subir automaticamente sempre que a VM reiniciar.

O `.env` ja vem preenchido com valores de desenvolvimento (banco `escola`,
usuario `django`, superusuario `admin`/`admin123`) para o ambiente subir
sem nenhum passo manual. Para mudar alguma credencial, edite o `.env` e
rode `vagrant provision` novamente.

## Acessando

- Aplicacao: http://localhost:8083/
- Admin do Django: http://localhost:8083/admin/ (usuario `admin`, senha `admin123`)

Use o admin para cadastrar `Curso`s e `Aluno`s e ve-los aparecer na listagem
em `/`.

## Comandos uteis

Entrar na VM:

```
vagrant ssh
```

Rodar comandos do Django dentro da VM:

```
cd /app
/opt/venv/bin/python manage.py shell
```

Acessar o banco diretamente:

```
psql -U django -h localhost -d escola
```

Reaplicar o provisionamento (util depois de alterar o Vagrantfile):

```
vagrant provision
```

Desligar a VM:

```
vagrant halt
```

Destruir a VM (apaga tudo, inclusive o banco de dados):

```
vagrant destroy
```

> Este projeto usa configuracoes simplificadas de proposito (SECRET_KEY
> fixa, DEBUG ligado, `.env` versionado no git com senha em texto puro)
> para fins didaticos. Nao utilize estas configuracoes em producao.

# Vagrant + Django + PostgreSQL

Ambiente didatico para a disciplina: uma VM Alpine (leve, sem Docker) que
sobe uma aplicacao Django simples (`escola`, com a app `alunos`) usando
PostgreSQL como banco de dados.

## Subindo o ambiente

```
vagrant up
```

O provisionamento faz tudo automaticamente:

- instala Python, PostgreSQL e o driver `psycopg2` via `apk`;
- cria o banco `escola` e o usuario `django` (senha `django`);
- cria um virtualenv em `/opt/venv` e instala o Django;
- roda as migracoes do banco;
- cria um super usuario do Django (`admin` / `admin123`);
- inicia o servidor de desenvolvimento (`manage.py runserver`) e o deixa
  configurado para subir automaticamente sempre que a VM reiniciar.

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
> fixa, DEBUG ligado, senha do banco em texto puro) para fins didaticos.
> Nao utilize estas configuracoes em producao.

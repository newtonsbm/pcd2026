# Atividade A3 - Docker

## Objetivo

Instalar o Docker, executar um CMS ou uma plataforma de blog em um container, configurar o mapeamento de portas e acessar a aplicação pelo navegador do hospedeiro. Além disso, você deve registrar a evidência da execução com uma captura de tela.

## Instruções

- Instale o Docker em sua máquina. (Docker Desktop no Windows ou macOS).
- Escolha uma plataforma simples para executar em containers, como WordPress, Ghost Blog ou outra opção de sua escolha.
- Configure o mapeamento de portas para que a aplicação fique acessível no navegador do hospedeiro.
- Abra a aplicação no navegador e confirme que ela está funcionando corretamente.
- Tire uma print da aplicação acessada pelo navegador do host.
- Salve a imagem na pasta da atividade.
- Faça o commit e o push da atividade com a evidência da ferramenta em funcionamento.
- Para procurar imagens no Docker Hub: https://hub.docker.com/search

# Material de Apoio

## 1. Verificar a instalação do Docker

```bash
docker --version
docker run hello-world
```

Se esses comandos forem executados corretamente, o Docker está instalado e funcionando.

## 2. Preparação do ambiente

Antes de iniciar a aplicação, verifique se o Docker está funcionando corretamente:

```bash
docker ps
```

Se a saída for vazia ou não houver erro, o ambiente está pronto para continuar.

## 3. Opções de CMS e plataformas de blog

### Opção 1: WordPress

O WordPress é uma das melhores opções para a atividade porque é muito usado e fácil de entender. Para facilitar a execução e manter a atividade simples, o aluno pode rodar o WordPress em um único container, sem precisar subir um banco separado.

```bash
docker run --name my-wordpress \
  -p 8080:80 \
  -d wordpress:latest
```

Essa forma é mais simples para a aula, porque o objetivo principal é entender o funcionamento do Docker e a publicação de uma aplicação em container. O WordPress pode ser acessado no navegador em `http://localhost:8080`.

### Opção 2: Ghost Blog

```bash
# Executar o Ghost Blog
docker run --name ghost-blog \
  -p 8080:2368 \
  -e NODE_ENV=production \
  -d ghost:latest
```

### Opção 3: Jupyter Notebook

```bash
# Executar o Jupyter Notebook
docker run --name jupyter-notebook \
  -p 8888:8888 \
  -d jupyter/base-notebook
```

O notebook Jupyter pode ser usado para documentar a atividade, registrar os comandos executados e incluir a evidência da aplicação funcionando.

## 4. Verificação e acesso

```bash
# Verificar containers em execução
docker ps

# Verificar logs, se necessário
docker logs my-wordpress  # ou o nome do seu container

# Acessar a aplicação no navegador
# http://localhost:8080
```

A aplicação deve ficar disponível no navegador em uma das portas configuradas, normalmente `http://localhost:8080`.

## 5. Comandos úteis para gerenciamento

```bash
# Parar containers
docker stop my-wordpress  # ou o nome do seu container

# Iniciar containers parados
docker start my-wordpress

# Remover containers (dados serão perdidos se não houver volumes)
docker rm my-wordpress

# Listar imagens baixadas
docker images

# Remover imagens não utilizadas
docker image prune

# Ver uso de espaço
docker system df

# Limpeza geral (cuidado!)
docker system prune -a
```

## 6. Capturar a tela da aplicação

1. Acesse `http://localhost:8080` no navegador.
2. Confirme que a aplicação está sendo servida corretamente.
3. Capture uma imagem da tela com a aplicação funcionando.
4. Salve a imagem na pasta da atividade.
5. Registre a execução no notebook Jupyter com os comandos utilizados e o resultado obtido.
6. Faça o commit e o push do projeto com a imagem de evidência.
d

## Critérios de avaliação

- Docker instalado corretamente.
- Aplicação executando em container.
- Mapeamento de portas configurado.
- Acesso realizado pelo navegador do hospedeiro.
- Screenshot da aplicação salva e enviada junto com o projeto.



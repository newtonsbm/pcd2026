# Comandos Docker 

- CLI CheatSheet: https://docs.docker.com/get-started/docker_cheatsheet.pdf 

## Geral

- `docker pull namespace/nome_imagem:nome_tag` : download da imagem a partir do DockerHub
- `docker image ls` : listar imagens Docker localmente armazenadas
- `docker images` : exibe as imagens locais com tag, tamanho e data de criação
- `docker run namespace/nome_image:nome_tag`: executa um container a partir de uma imagem
- `docker run --name nome_container -d -p porta_host:porta_container namespace/imagem:tag` : executa um container em segundo plano com nome customizado
- `docker run --rm -p porta_host:porta_container namespace/imagem:tag` : executa um container e o remove automaticamente ao encerrar
- `docker run -p porta_host:porta_container namespace/imagem:tag` : executa um container realizando um mapeamento de portas entre host e container (guest)
- `docker run -p porta_host:porta_container -v path/host:past/container/guest namespace/imagem:tag` : executa um container com mapeamento de portas e mapeamento de volume

### Outros exemplos

#### Build
- `docker build -t nome_da_imagem:tag .` : constrói uma imagem a partir de um Dockerfile no diretório atual
- `docker build -t minha_app:v1.0 .` : exemplo de build com nome específico e tag

#### Execução e gerenciamento
- `docker ps` : lista containers em execução
- `docker ps -a` : lista todos os containers (incluindo parados)
- `docker start container_id` : inicia um container parado
- `docker restart container_id` : reinicia um container em execução
- `docker stop container_id` : para um container em execução
- `docker rm container_id` : remove um container parado
- `docker rm -f container_id` : força a remoção de um container em execução
- `docker rmi image_id` : remove uma imagem
- `docker exec -it container_id /bin/bash` : acessa o terminal de um container em execução
- `docker stats` : mostra uso de CPU, memória e rede dos containers em execução
- `docker cp arquivo.txt container_id:/caminho/` : copia um arquivo do host para dentro do container

#### Logs e debug
- `docker logs container_id` : visualiza os logs de um container
- `docker logs -f container_id` : acompanha os logs em tempo real
- `docker inspect container_id` : exibe informações detalhadas sobre um container
- `docker network ls` : lista redes Docker disponíveis
- `docker volume ls` : lista volumes persistentes criados

#### Limpeza
- `docker system prune` : remove containers parados, redes não utilizadas e imagens órfãs
- `docker container prune` : remove apenas containers parados
- `docker image prune` : remove apenas imagens órfãs
- `docker volume prune` : remove volumes não utilizados

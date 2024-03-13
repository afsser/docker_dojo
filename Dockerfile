# Use a imagem oficial do Ubuntu como base
FROM ubuntu:latest

# Atualize os pacotes e instale o git
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    make \
    cmake \
    git \
    libreadline-dev \
    libncurses5-dev \
	curl \
	inetutils-ping 

# Crie um diretório para o projeto
WORKDIR /app

# Clone o repositório minishell do GitHub
RUN git clone https://github.com/vinicius-f-pereira/minishell.git

# Comando opcional: ajuste o diretório de trabalho para o repositório clonado
WORKDIR /app/minishell

RUN make

EXPOSE 1080

RUN ./minishell

CMD ["./minishell", "--config", "/caminho/para/seu/arquivo.conf"]

# docker run -p 1080:80 -v ~/dojo/docker-compose/42.conf -v ~/dojo/docker-compose/ft_helloworld.html:/usr/share/nginx/html/42.html nginx
# docker run -p 1080:80 -v /nfs/homes/fcaldas-/dojo/docker-compose/42.conf -v /nfs/homes/fcaldas-/dojo/docker-compose/ft_helloworld.html nginx
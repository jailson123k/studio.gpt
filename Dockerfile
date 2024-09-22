# Use uma imagem base que suporte systemd, por exemplo, Ubuntu 
FROM ubuntu:20.04 

# Instale os pacotes necessários 
RUN apt-get update && \ 
apt-get install -y shellinabox && \ 
apt-get install -y systemd && \ 
apt-get clean && \ 
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
RUN echo 'root:root' | chpasswd 
# Exponha a porta do terminal baseado na web 
EXPOSE 4200 

# Inicie o shellinabox 
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]

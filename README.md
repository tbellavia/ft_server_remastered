# Server remastered

This project aims to refactore ft_server from 42 school with docker-compose.\
The idea is to treat all of the services as a container, for that, we'll use official images for all of the services we need.

## Architecture
### Stack
The stack is composed of the following images :
- Back-end :
  - nginx
  - mariaDB
- Front-end :
  - wordpress
  - phpmyadmin

### Volumes
We'll need a persistent volume for wordpress, the idea is to add a level of abstraction and encapsulate the volume into a dedicated server.\
For that purpose we can use the docker plugin from [Victor Vieux](https://github.com/vieux) that use SSH protocol to transfer file from services to the distant volume.\
There is a more efficient way to accomplish our goal, it is named NFS (Network File System), it uses UDP over TCP, which ensure a faster way to transfer our files, because UDP is faster than TCP (no handshake).

### Networks
We want to encapsulate our services into networks, it ensure that some services cannot access to other services.
![Architecture](https://raw.githubusercontent.com/Cardiox12/ft_server_remastered/master/architecture.png)

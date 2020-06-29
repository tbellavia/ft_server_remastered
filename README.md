# Server remastered

This project aims to refactore ft_server from 42 school with docker-compose.\
The idea is to treat all of the services as a container, for that, we'll use official images for all of the services we need.

## Architecture
### Stack
[FR] -
La stack est composée des images suivantes :
- Back-end :
  - nginx
  - mariaDB
- Front-end :
  - wordpress
  - phpmyadmin

[EN] - 
The stack is composed of the following images :
- Back-end :
  - nginx
  - mariaDB
- Front-end :
  - wordpress
  - phpmyadmin

### Volumes
[FR] -
Pour notre wordpress, nous aurons besoin d'un volume persistent, l'idée est d'ajouter un niveau d'abstraction et d'encapsuler le volume sur un serveur dédié à cet usage.\
Afin de mettre en place un tel système, nous pouvons utiliser les docker plugins, dont notamment le docker plugin de [Victor Vieux](https://github.com/vieux) qui utilise le protocole SSH afin de transférer les fichiers du service au volume distant.\
Cependant, il existe une méthode plus éfficiente, les NFS (Network File System), qui utilise le protocole UDP à la place du protocole TCP, cela nous confère une vitesse de transfère plus élevée car UDP ne procède pas au handshake. (SYN - SYN ACK - ACK)
[EN] -
We'll need a persistent volume for wordpress, the idea is to add a level of abstraction and encapsulate the volume into a dedicated server.\
For that purpose we can use the docker plugin from [Victor Vieux](https://github.com/vieux) that use SSH protocol to transfer file from services to the distant volume.\
There is a more efficient way to accomplish our goal, it is named NFS (Network File System), it uses UDP over TCP, which ensure a faster way to transfer our files, because UDP is faster than TCP (no handshake). (SYN - SYN ACK - ACK)

![handshake](https://www.luxoft-training.com/upload/medialibrary/452/TCP%20handshake.png)

### Networks
[FR] -
L'objectif avec les networks ici est d'assuré un cloisonnement entre les services en définissant différents réseaux.
Cela nous assure que certains services n'ont pas accès à d'autres services plus critiques en cas d'attaque.
[EN] -
We want to encapsulate our services into networks, it ensure that some services cannot access to other services.
![Architecture](https://raw.githubusercontent.com/Cardiox12/ft_server_remastered/master/architecture.png)

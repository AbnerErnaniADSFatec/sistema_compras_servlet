## Sistema de Compras usando um Servlet Básico

Um servidor básico usando a linguagem de programação Java e Servlet, necessário Java 8 ou superior e o gradle instalado.

## Instalação do MariaDB
```
# apt-get update
# apt-get install mariadb-server
# mysql_secure_installation
```

## Verificar se o serviço está no ar
```
# /etc/init.d/mysql status
```

## Após a instalação do MariaDB
```
# mariadb -u root -p
```
```
> use mysql;
> update user set plugin='' where User='root';
> flush privileges;
> exit
```

## Configurar acesso remoto
### Comentar a linha do arquivo `/etc/mysql/mariadb.conf.d/50-server.cnf`
```
# bind-address = localhost
```
### Conectar ao banco e executar o script
```
MariaDB > CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
```
```
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
```
```
MariaDB > SELECT User, Host FROM mysql.user WHERE Host <> 'localhost';
```

## Executar com o gradle

```
$ gradle apprun
```
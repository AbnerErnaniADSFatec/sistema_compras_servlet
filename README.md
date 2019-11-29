## Sistema de Compras usando um Servlet Básico

Uma aplicação básico usando a linguagem de programação Java e Servlet, necessário Java 8 ou superior e o gradle instalado, é preciso baixar a [máquina virtual](https://fatecspgov-my.sharepoint.com/:u:/g/personal/abner_anjos_fatec_sp_gov_br/EQlkY3XhOL9JucxSdpoPzVMBQY_k5AxQJXwaQcfkjBDlgw?e=qdZQuh) para o servidor de banco de dados.

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
# mysql
```
```
> use mysql;
> update user set plugin='' where User='servlet';
> flush privileges;
> exit
```

## Configurar acesso remoto
### Comentar a linha do arquivo `/etc/mysql/mariadb.conf.d/50-server.cnf`
```
# bind-address = localhost
```

### Reinicie o serviço
```
# /etc/init.d/mysql restart
```

### Conectar ao banco e executar o script para criar a base de dados
```
MariaDB > CREATE DATABASE estoque;
```

### Conectar ao banco e executar o script para criar o usuário e dar acesso ao banco
```
MariaDB > CREATE USER 'servlet' IDENTIFIED BY 'servlet';
```
```
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'servlet' IDENTIFIED BY 'servlet' WITH GRANT OPTION;
```
```
MariaDB > SELECT User, Host FROM mysql.user;
```

## Executar com o gradle

```
$ gradle apprun
```

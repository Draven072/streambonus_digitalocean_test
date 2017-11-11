# streambonus_digitalocean_test

**install.sh** - скрипт *oneclick-install* развёртывания дроплета на DigitalOcean, установки docker-engine, диплоя докер-контейнеров, создания юзера с правами sudo, импорт публичного ключа и очищения файлов hosts и newhost в конце установки.

`1-digiocean_host_create.yml` - плейбук ansible для создания дроплета на DigitalOcean.

`2-digiocean_docker-ce_install.yml` - плейбук установки docker-engine в дроплет.

`3-digiocean_dockers.yml` - загрузка с GitHub и развертывание докеров nginx-proxy, app, postgresql, redis и rabbitmq. Создание внутренней сети swarm.

`4-digiocean_add_sudouser.yml` - создание пользователя sbonus с правами sudo (пароль в плейбуке), аплоад публичного ключа в профиль юзера.

Проверка наличия импортированной базы PostgreSQL:

```
root@sb-docker:~# docker exec -it sb-postgres psql -U postgres
psql (9.5.3)
Type "help" for help.

postgres=# \l
                                List of databases
      Name       |  Owner   | Encoding | Collate | Ctype |   Access privileges   
-----------------+----------+----------+---------+-------+-----------------------
 postgres        | postgres | UTF8     | UTF-8   | UTF-8 | 
 streambonus_dev | postgres | UTF8     | C       | UTF-8 | 
 template0       | postgres | UTF8     | UTF-8   | UTF-8 | =c/postgres          +
                 |          |          |         |       | postgres=CTc/postgres
 template1       | postgres | UTF8     | UTF-8   | UTF-8 | =c/postgres          +
                 |          |          |         |       | postgres=CTc/postgres
(4 rows)

postgres=# 

``` 

# HEX-Railsbox

Данный инструмент устанавливает все необходимые пакеты в Ubuntu, настраивает PostgreSQL, создаёт папку для проекта и файлы database.yml и secrets.yml

Для установки нужно склонировать репо себе в папку.
Добавить в папку keys свой публичный ключ, обновить переменные в файле ```provision/production.yml```:

```
# Версия ruby
ruby_version: '2.2.2'
# Пользователь, от лица которого будет происходит деплой
user: 'deployer'
# Домашняя директория
home: '/home/{{ user }}'
# Директория установки Rbenv
rbenv_root: '{{ home }}/.rbenv'
# Название приложения
name: 'example'
# Путь до нашего приложения
application: '{{ home }}/apps/{{ name }}'
# Домен сайта для nginx
domain: 'example.com'
```

Затем в командной строке переходим в каталог ```provision``` и выполняем команду

```ansible-playbook -i46.78.90.111, production.yml```

Где ```46.78.90.111``` нужно заменить на IP-адрес сервера на который будет производиться деплой


За основу взяты статьи:
* https://mkdev.me/posts/nastroyka-i-deploy-rails-prilozheniy-pri-pomoschi-ansible-i-capistrano
* http://habrahabr.ru/company/selectel/blog/196620/

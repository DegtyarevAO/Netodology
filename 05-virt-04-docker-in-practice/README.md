# Домашнее задание к занятию 5. «Практическое применение Docker»

## задание 1

<img width="624" height="310" alt="image" src="https://github.com/user-attachments/assets/f4dd1dec-f03d-4a0c-a81a-579e4b0061b2" />

## Задание 2*

1. Создайте в yandex cloud container registry с именем "test" с помощью "yc tool" . [Инструкция](https://cloud.yandex.ru/ru/docs/container-registry/quickstart/?from=int-console-help)
2. Настройте аутентификацию вашего локального docker в yandex container registry.
3. Соберите и залейте в него образ с python приложением из задания №1.
4. Просканируйте образ на уязвимости.
5. В качестве ответа приложите отчет сканирования.

<img width="624" height="152" alt="image" src="https://github.com/user-attachments/assets/9234a987-dc7e-47ea-92af-7a76c5c016e7" />

<img width="624" height="99" alt="image" src="https://github.com/user-attachments/assets/762987ef-cb0f-4845-a77a-08e247ca7301" />

<img width="624" height="215" alt="image" src="https://github.com/user-attachments/assets/11a1fff8-3246-4871-bd32-e842767883c8" />

<img width="624" height="198" alt="image" src="https://github.com/user-attachments/assets/1f544d4d-b422-4a9e-9d46-3cc3c2a66169" />

<img width="624" height="133" alt="image" src="https://github.com/user-attachments/assets/ebd10093-2a60-4c76-a874-7ff1b5a976bf" />

#### Жизнь жестока 

<img width="624" height="554" alt="image" src="https://github.com/user-attachments/assets/79d0e42c-3861-4b6f-96bd-36f5ac0acb00" />

## Задание 3.

1. Изучите файл "proxy.yaml"
2. Создайте в репозитории с проектом файл ```compose.yaml```. С помощью директивы "include" подключите к нему файл "proxy.yaml".
3. Опишите в файле ```compose.yaml``` следующие сервисы: 

- ```web```. Образ приложения должен ИЛИ собираться при запуске compose из файла ```Dockerfile.python``` ИЛИ скачиваться из yandex cloud container registry(из задание №2 со *). Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.5```. Сервис должен всегда перезапускаться в случае ошибок.
Передайте необходимые ENV-переменные для подключения к Mysql базе данных по сетевому имени сервиса ```web``` 

- ```db```. image=mysql:8. Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.10```. Явно перезапуск сервиса в случае ошибок. Передайте необходимые ENV-переменные для создания: пароля root пользователя, создания базы данных, пользователя и пароля для web-приложения.Обязательно используйте уже существующий .env file для назначения секретных ENV-переменных!

2. Запустите проект локально с помощью docker compose , добейтесь его стабильной работы: команда ```curl -L http://127.0.0.1:8090``` должна возвращать в качестве ответа время и локальный IP-адрес. Если сервисы не стартуют воспользуйтесь командами: ```docker ps -a ``` и ```docker logs <container_name>``` . Если вместо IP-адреса вы получаете информационную ошибку --убедитесь, что вы шлете запрос на порт ```8090```, а не 5000.

5. Подключитесь к БД mysql с помощью команды ```docker exec -ti <имя_контейнера> mysql -uroot -p<пароль root-пользователя>```(обратите внимание что между ключем -u и логином root нет пробела. это важно!!! тоже самое с паролем) . Введите последовательно команды (не забываем в конце символ ; ): ```show databases; use <имя вашей базы данных(по-умолчанию example)>; show tables; SELECT * from requests LIMIT 10;```.

6. Остановите проект. В качестве ответа приложите скриншот sql-запроса.

<img width="624" height="248" alt="image" src="https://github.com/user-attachments/assets/88df47d1-fff0-4339-87eb-9401319f82b9" />

<img width="624" height="37" alt="image" src="https://github.com/user-attachments/assets/66fbecee-72cf-4a4c-8e1d-48c23ad93065" />

<img width="624" height="228" alt="image" src="https://github.com/user-attachments/assets/4b2f2c1c-3e19-4059-b952-2a4c5d0a709d" />

<img width="624" height="295" alt="image" src="https://github.com/user-attachments/assets/a1aa43eb-7fa6-4f85-b4c5-cdd51c4967c4" />

<img width="624" height="227" alt="image" src="https://github.com/user-attachments/assets/92c47b24-f478-48c8-a62a-f9bc56f11856" />

<img width="597" height="278" alt="image" src="https://github.com/user-attachments/assets/2a372486-cc33-4a06-897c-5e1f9611f8f7" />

<img width="624" height="100" alt="image" src="https://github.com/user-attachments/assets/d069ebba-dd3b-4571-a6b8-1b7a15e0db36" />

## Задание 4

### 1. Запустите в Yandex Cloud ВМ (вам хватит 2 Гб Ram).

создал в ручную через web интерфейс на Yandex Cloud.

<img width="624" height="123" alt="image" src="https://github.com/user-attachments/assets/589435e9-cb30-4327-9c15-1787727bd7a1" />

### 2. Подключитесь к Вм по ssh и установите docker.

Сделал аналогично домашнему учебному стенду

### 3. Напишите bash-скрипт, который скачает ваш fork-репозиторий в каталог /opt и запустит проект целиком.

#### остался на ВМ в облаке, не сохранил скрин, нужно поднять машину зайти и скопипастить

#### при запуске проекта создалась БД но не создалась таблица, не понял почему, создал в ручную.

```
CREATE TABLE dev_net.requests (
                id INT AUTO_INCREMENT PRIMARY KEY,
                request_date DATETIME,
                request_ip VARCHAR(255)
            );
```

### 4. Зайдите на сайт проверки http подключений, например(или аналогичный): ```https://check-host.net/check-http``` и запустите проверку вашего сервиса ```http://<внешний_IP-адрес_вашей_ВМ>:8090```. Таким образом трафик будет направлен в ingress-proxy. Трафик должен пройти через цепочки: Пользователь → Internet → Nginx → HAProxy → FastAPI(запись в БД) → HAProxy → Nginx → Internet → Пользователь

   
#### поигрался с запросами

<img width="624" height="120" alt="image" src="https://github.com/user-attachments/assets/d1216fa9-f79d-4dcb-aaab-993da04ec7de" />

#### Внешние запросы

<img width="624" height="568" alt="image" src="https://github.com/user-attachments/assets/24bb2dde-873b-43d9-b5a1-f24771611509" />

### 5. (Необязательная часть) Дополнительно настройте remote ssh context к вашему серверу. Отобразите список контекстов и результат удаленного выполнения ```docker ps -a```

не получилось, context создается, но не смотря на успешно создание не выводит результата по команде ```docker ps -a```, если подключиться по ssh то там все отоброжается.

PS - пойду за скриптом наделаю еще скринов, повторю задание.

### 6. Повторите SQL-запрос на сервере и приложите скриншот и ссылку на fork.

<img width="624" height="494" alt="image" src="https://github.com/user-attachments/assets/881f5e3b-ae3f-4c63-9edb-4abba78802e1" />

<img width="624" height="556" alt="image" src="https://github.com/user-attachments/assets/8c79ceca-184d-4486-b238-0556f0e4e32b" />

https://github.com/DegtyarevAO/shvirtd-example-python

## задание 6.

не могу запустить dive.

и ответа найти не получается:

<img width="1226" height="490" alt="image" src="https://github.com/user-attachments/assets/d50a3028-9cc5-4738-a5ef-4fe32ed32da0" />




# Домашнее задание к занятию 5. «Практическое применение Docker»

## задание 1 Сделайте в своем GitHub пространстве fork репозитория.

Создайте файл Dockerfile.python на основе существующего Dockerfile:

Используйте базовый образ python:3.12-slim

Обязательно используйте конструкцию COPY . . в Dockerfile

Создайте .dockerignore файл для исключения ненужных файлов

Используйте CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"] для запуска

Протестируйте корректность сборки

(Необязательная часть, *) Изучите инструкцию в проекте и запустите web-приложение без использования docker, с помощью venv. (Mysql БД можно запустить в docker run).

(Необязательная часть, *) Изучите код приложения и добавьте управление названием таблицы через ENV переменную.

<img width="1762" height="886" alt="image" src="https://github.com/user-attachments/assets/9d178b67-3cf9-4fc2-92d1-b6e7a11cf6f8" />

## Задание 2*

1. Создайте в yandex cloud container registry с именем "test" с помощью "yc tool" . Инструкция
2. Настройте аутентификацию вашего локального docker в yandex container registry.
3. Соберите и залейте в него образ с python приложением из задания №1.
4. Просканируйте образ на уязвимости.
5. В качестве ответа приложите отчет сканирования.

<img width="624" height="152" alt="image" src="https://github.com/user-attachments/assets/c4a3da0f-8c0b-44e2-97bb-c123d20a7978" />

<img width="624" height="99" alt="image" src="https://github.com/user-attachments/assets/dd871761-d9f1-4e6f-a6f4-b4bcfa1f2e54" />

<img width="624" height="215" alt="image" src="https://github.com/user-attachments/assets/f87cb292-6bd0-4346-a064-1712eba3d0ee" />

<img width="624" height="198" alt="image" src="https://github.com/user-attachments/assets/2fec9edf-9d8c-401e-bcb1-9ffb2118fd2e" />

<img width="624" height="133" alt="image" src="https://github.com/user-attachments/assets/a3bad0c8-cb37-43ff-b51a-e1ac0ece3e36" />

#### Жизнь жестока :(

<img width="624" height="554" alt="image" src="https://github.com/user-attachments/assets/30e7b999-8e84-45a2-a8d8-7bab2d01da3c" />

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

<img width="624" height="248" alt="image" src="https://github.com/user-attachments/assets/ee232227-7b8a-412a-b883-9276323fd5da" />

<img width="624" height="37" alt="image" src="https://github.com/user-attachments/assets/8e90af13-473a-45d0-919c-f83ee7a6ee59" />

<img width="624" height="228" alt="image" src="https://github.com/user-attachments/assets/7836d67b-7ef2-414c-af86-8c0ea42b16aa" />

<img width="624" height="295" alt="image" src="https://github.com/user-attachments/assets/fdacc67a-d228-41cd-857f-410a7b5a21fb" />

<img width="624" height="227" alt="image" src="https://github.com/user-attachments/assets/6ad5d2d2-0080-41bc-bcf0-1396bd6b1130" />

<img width="597" height="278" alt="image" src="https://github.com/user-attachments/assets/a3107e3f-e1e8-4e38-aa13-9847c5c49396" />

<img width="624" height="100" alt="image" src="https://github.com/user-attachments/assets/9b38b437-66e0-42c3-9936-e846573d04d1" />

## Задание 4

1. Запустите в Yandex Cloud ВМ (вам хватит 2 Гб Ram).
2. Подключитесь к Вм по ssh и установите docker.
3. Напишите bash-скрипт, который скачает ваш fork-репозиторий в каталог /opt и запустит проект целиком.
4. Зайдите на сайт проверки http подключений, например(или аналогичный): ```https://check-host.net/check-http``` и запустите проверку вашего сервиса ```http://<внешний_IP-адрес_вашей_ВМ>:8090```. Таким образом трафик будет направлен в ingress-proxy. Трафик должен пройти через цепочки: Пользователь → Internet → Nginx → HAProxy → FastAPI(запись в БД) → HAProxy → Nginx → Internet → Пользователь
5. (Необязательная часть) Дополнительно настройте remote ssh context к вашему серверу. Отобразите список контекстов и результат удаленного выполнения ```docker ps -a```
6. Повторите SQL-запрос на сервере и приложите скриншот и ссылку на fork.

### Запустите в Yandex Cloud ВМ (вам хватит 2 Гб Ram).

не понял как сделать, просто в веб развернул образ ubuntu, подсунув ключ для ssh.

Установил Docker аналогично как на домашнем учебном стэнде через apt.

### скрипт для скачивания fork репозитария

<img width="2048" height="308" alt="image" src="https://github.com/user-attachments/assets/8b12c11f-116d-41a1-adbc-f5575bd6d5c6" />

\```
cd /opt
sudo git clone https://github.com/DegtyarevAO/shvirtd-example-python
cd /opt/shvirtd-example-python
sudo docker compose up -d
\```


<img width="624" height="123" alt="image" src="https://github.com/user-attachments/assets/e32b178a-43c2-4dcf-8db0-5af9605a3684" />

создалась БД но не создалась таблица, не понял почему, создал в ручную.

### Внешние запросы на 8090

<img width="624" height="568" alt="image" src="https://github.com/user-attachments/assets/42ffd2fb-d123-417b-9fdf-6b6560d5b80b" />

### Выполнение на ВМ в облаке

<img width="624" height="494" alt="image" src="https://github.com/user-attachments/assets/75936a23-218e-40c6-bf06-0f88c1cf1573" />

<img width="624" height="556" alt="image" src="https://github.com/user-attachments/assets/dfcdd4c6-7d22-44e2-9d59-2cc4b2332b87" />

### Дополнительно настройте remote ssh context к вашему серверу.

<img width="2954" height="574" alt="image" src="https://github.com/user-attachments/assets/24b48677-4163-4ba4-826b-d38e148e999d" />

#### Не смотря на удасное выполнение docker compose create, я не вижу результат ps -a и даже прописывая стандартный порт

<img width="1876" height="800" alt="image" src="https://github.com/user-attachments/assets/40833f18-8fbc-4143-9b85-8b4b6ec2c36d" />

## Задание 5

#### что то пошло не так :(

## Задание 6
Скачайте docker образ ```hashicorp

<img width="1256" height="228" alt="image" src="https://github.com/user-attachments/assets/fc8c6324-8c09-4098-a73a-727b3b8507b3" />



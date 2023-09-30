## Как запустить
1. Подготовить БД
   - Создать базу данных\
     ``CREATE DATABASE "CRM"
       WITH
       OWNER = postgres
       ENCODING = 'UTF8'
       CONNECTION LIMIT = -1;``
   - Выполнить database/seq.sql
   - Выполнить database/tables.sql
   - Выполнить database/insert.sql

2. Подключить бд из java
   - В файле `/Project/crm-backend/src/main/java/common/DBService.java` изменить\
     `private static final String USER = "";` - Имя пользователя в бд\
     `private static final String PASS = "";` - Пароль к бд

3. Деплой
   - Файлы .jsp из `/crm-backend/target/class` скопировать в `Tomcat/webapps/shop`
   - Папки `common, dao, servlets` из `/crm-backend/target/class` скопировать в `Tomcat/webapps/shop/WEB-INF/classes`

4. Запуск
   - Запустить `Tomcat/bin/startup.bat`
   - В браузере ввести `http://localhost:8080/crm/deal`

## Структура
   - `/crm-backend/src/main/java/common` 		- классы для сущностей
   - `/crm-backend/src/main/java/dao`    		- классы для обращения к бд
   - `/crm-backend/src/main/java/servlets`	- сервлеты обрабатывающие get, post запросы
   - `/crm-backend/src/main/java/*.jsp`		- страницы приложение (html + java)
<a name="to_lift"><h3>Тестовое задание</h3></a>

Сервис на Ruby on Rails

#### Содержание
  - *[Задание](#task)*
  - *[Функционал](#update)*
  - *[Использование](#use)*
  - *[Требования](#version)*

<a name="task"><h4>Задание</h4></a>

Необходимо реализовать сервис со следующим функционалом на Ruby on Rails.
В базе данных (желательно применить Postgresql) должна быть таблица currency c колонками:

id|name|rate
:---:|:---:|:---:
первичный ключ|название валюты|курс валюты к рублю

И соответсвующая модель.

Должна быть Rake таска для обновления данных в таблице currency. Данные по курсам валют можно взять [отсюда](http://www.cbr.ru/scripts/XML_daily.asp).
Реализовать 2 REST API метода:

`GET /currencies` — должен возвращать список курсов валют с возможность пагинации

`GET /currencies/:id` — должен возвращать курс валюты для переданного id

Ответ должен быть в формате JSON.
Наличие тестов обязательно.
API должно быть закрыто bearer авторизацией.

[Наверх](#to_lift)

<a name="update"><h4>Функционал</h4></a>
  + реализовано 2 REST API метода
  + реализована Rake задача для обновления данных в таблице валют
  + ответ сервера приходит в формате JSON
  + сервис зактыт Bearer-авторизацией (token-авторизация)
  + тесты номинальные для проверки отсутствия доступа к реализованным методам

[Наверх](#to_lift)

<a name="use"><h4>Использование</h4></a>


  + скопируйте программу из репозитория:
  
    `git clone git@github.com:occmium/currency-api.git`

  + перейдите в папку с программой:

    `cd currency-api`

  + для установки менеджера библиотек введите в терминале

    `gem install bundler` и нажмите `Enter`

  + запустите менеджер библиотек

    `bundle`

  + для первичной настройки базы данных

    `bundle exec rails db:migrate`
  
    `bundle exec rails db:seed`
  
  + увидеть допустимый (валиндный) ACCESS_TOKEN
    
    `bundle exec rails с`
    
    `ApiKey.first.access_token`    
    
    `exit`
    
  + для заполнения или обновления данных базы данных
  
    `bundle exec rails db:update`

  + для старта сервера на локальной машине

    `bundle exec rails s`

  + для получения ответа сервера с помощью утилиты [cURL](https://curl.haxx.se/)
  
    `curl http://localhost:3000/currencies/ -H 'Authorization: Token token="ACCESS_TOKEN"'`
  
  + для запуска тестов
  
    `bundle exec rails test`

[Наверх](#to_lift)
<a name="version"><h4>Требования</h4></a>

program|version
:---:|:---:
Ruby|2.5.5p157
Rails|5.2.3

[Наверх](#to_lift)

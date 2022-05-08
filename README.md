# QUAKE LOG PARSER

![image](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![image](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)
![image](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![image](https://img.shields.io/badge/ruby-v2.7.0-blue)
![image](https://img.shields.io/badge/coverage-93%25-brightgreen)

## How to Run?

- Using local environment

```
bundle install
rails db:create db:migrate db:seed
rails s
```

- Using Docker

```
docker-compose build
docker-compose run web rake db:create db:migrate db:seed
docker-compose up
```

The project will run http://localhost:3000/admin

## Project details

For this project, I am applying these practices:

- Ruby (v2.7.0)

- Dependency Injection (dry-auto_inject)

- Repository Pattern

- Interfaces control

- Trestle admin

- For specs: (Rspec, Faker, FactoryBot, Coverage, Database Cleaner)

- Docker

The processing of the Log file is done by the **Seed** command.

## TODOs

- Refactor the _quake_log_service_ to use an ETL helper and work with the data in memory to persist the nested data just one time.
- Create github actions to Deploy on Free Heroku.
- Implement New Relic and ActiveRecord Analyzer for more observability.

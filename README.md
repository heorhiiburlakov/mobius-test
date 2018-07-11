# README

* `EDITOR="nano --wait" bin/rails credentials:edit`

* `cp config/database.yml.example config/database.yml`

* Fill in with the  appropriate data (db username and password)

* `rake db:create`

* `rake db:migrate`

* `rails s`

* Visit http://localhost:3000

### Api endpoint

`/api/v1/users/current?email='your_email'&password='your_password'`
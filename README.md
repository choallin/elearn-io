# README

## Setup
When deploying this app in a VM clone the git repository wiht `git clone git@github.com:elear-io/courses.git`

Then in the project directory:
- run `bundle install`
- configure database in config/database.yml
- run `bin/rails db:create`
- run `bin/rails db:migrate`
- run `bin/rails db:seed`

Start the server with `bin/rails s`

Please don't forget to configure a proxy server like nginx.

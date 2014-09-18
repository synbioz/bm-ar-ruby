# Benchmark

## Setup

Create the database bm on your postgresql instance.

  bundle install

Configure your `config/database.yml`.

  bundle exec ruby db/setup.rb

## Inject some datas

You can specify the amount of lines you want, defaut is 1 million.

  LINES=10_000 bundle exec ruby db/seed.rb

## Run the benchmark

  bundle exec ruby bm/bm.rb

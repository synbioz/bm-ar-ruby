require_relative 'configuration'

sql_create_schema = "
  CREATE TABLE posts (
    id SERIAL PRIMARY KEY
  );
  CREATE TABLE ratings (
    id SERIAL PRIMARY KEY,
    score integer,
    post_id integer
  );
"
ActiveRecord::Base.connection.execute(sql_create_schema)

require_relative 'configuration'

sql_create_schema = "
  CREATE TABLE posts (
    id SERIAL UNIQUE
  );
  CREATE TABLE ratings (
    id SERIAL UNIQUE,
    score integer,
    post_id integer,
    user_id integer
  );
"
ActiveRecord::Base.connection.execute(sql_create_schema)

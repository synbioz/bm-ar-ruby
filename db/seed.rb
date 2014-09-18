require_relative 'configuration'

lines = ENV['LINES'] ? ENV['LINES'] : 1_000_000

Dir.glob('./models/*.rb') { |m| require m }
Post.delete_all
Rating.delete_all

puts "Seeding posts…"
sql_post = "insert into posts
  select t.id as id
  from (select * from generate_series(1,#{lines}) as id)
  as t;"
ActiveRecord::Base.connection.execute(sql_post)

puts "Seeding ratings…"
sql_rating = "insert into ratings (score, post_id)
  select (random() * 5)::integer as score, t.post_id as post_id
  from (select posts.id as post_id from posts, (select * from generate_series(1,3) as id) as p) as t;"
ActiveRecord::Base.connection.execute(sql_rating)

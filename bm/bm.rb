require_relative '../db/configuration'
Dir.glob('./models/*.rb') { |m| require m }

Benchmark.bmbm do |performance|
  performance.report("SQL:")    { Post.order_by_rating_sql }
  performance.report("Ruby:")   { Post.find_with_ar_and_sort_with_ruby }
end

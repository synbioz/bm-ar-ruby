class Post < ActiveRecord::Base
  has_many :ratings

  def self.find_with_ar_and_sort_with_ruby
    includes(:ratings).group('posts.id').sort_by(&:avg_rating)
  end

  def self.order_by_rating_sql
    find_by_sql("
      SELECT posts.*, AVG(ratings.score) AS average FROM posts
      LEFT OUTER JOIN ratings ON posts.id = ratings.post_id
      GROUP BY posts.id
      ORDER BY average DESC NULLS LAST")
  end

  def avg_rating
    ratings.average(:score) || 0
  end
end

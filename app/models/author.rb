class Author < ActiveRecord::Base

  has_many :posts

  def self.trending
    joins(:posts => :comments).group('authors.id').where('comments.created_at >= ?', 7.days.ago).order('count(comments.id) desc').all
  end
end

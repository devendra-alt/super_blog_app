class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', counter_cache: true
  has_many :likes
  has_many :comments

  def update_counter
    user.update(post_count: user.posts.size)
  end

  def recent_comment
    comments.where(post_id: self[:id]).order(created_at: :desc).limit(5)
  end
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  def update_counter
    post.update(comments_count: post.comments.size)
  end
end

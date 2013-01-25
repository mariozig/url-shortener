class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :url
  # attr_accessible :title, :body

  def self.create_comment(text, url_id, user_id)
    comment = Comment.new
    comment.comment = text
    comment.user_id = user_id
    comment.url_id = url_id
    comment.save
  end

  def display_comment
  end
end

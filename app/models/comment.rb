class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :url
  # attr_accessible :title, :body
end

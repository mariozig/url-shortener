class Click < ActiveRecord::Base
  belongs_to :user
  belongs_to :url, :class_name => "URL"
  # attr_accessible :title, :body
end

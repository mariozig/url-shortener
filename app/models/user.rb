class User < ActiveRecord::Base
  has_many :urls, :class_name => "URL"
  has_many :comments
  has_many :clicks
  # attr_accessible :title, :body
end

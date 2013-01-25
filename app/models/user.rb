class User < ActiveRecord::Base
  # MZ: If you name the class "Url" (singular, camelcase (even though that makes no sense on an acronym))
  # I believe rails will take care of everything so you don't need to explicitly define a :class_name attribute
  has_many :urls, :class_name => "URL"
  has_many :comments
  has_many :clicks
  # attr_accessible :title, :body
  def self.create_user(name)
    user = User.new
    user.name = name
    user.save
  end
end


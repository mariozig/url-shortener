class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :url
  # attr_accessible :title, :body

  # MZ: You can pass the full url and user objects here
  def self.create_comment(text, url_id, user_id)
    comment = Comment.new
    comment.comment = text
    # MZ: If you're passing the full objects around you can do this:
    # Rails will automatically convert to an id and all that... i think in this example
    # there isn't any real benefit but if for whatever reason you wanted to access additioanl attributes about
    # the user or URL it would be nice to have the real object instead of just the ID then forcing another hit on the db when
    # you look up the user/url from his id
    # comment.user = user
    # comment.url = url
    comment.user_id = user_id
    comment.url_id = url_id
    comment.save
  end

  def display_comment
  end
end

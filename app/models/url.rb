require 'launchy'
class URL < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :clicks
  # attr_accessible :title, :body

  # def get_url(url)
  #   @long_url = url
  #   save
  # end

  # def get_short_url
  #   @short_url = @id
  #   save
  # end

  def self.create_url(long_url, user_id = nil)
    url = URL.new
    url.long_url = long_url
    url.user_id = user_id
    url.get_short_url
    url
  end

  def get_short_url
    save
    self.short_url = id
    save
  end

  def open_url(user_id)
    Launchy.open(long_url)
    click = Click.new
    click.url_id = id
    click.user_id = user_id
    click.save
  end

  def self.click_counter(url_id)
    URL.find(url_id).clicks.count
  end

  def self.unique_click_counter(url_id_)
    Click.where(url_id: url_id_).uniq.pluck(:user_id).count
  end

  def self.clicks_from_ten_min(url_id_)
    Click.where(:created_at => (10.minutes.ago..Time.now), :url_id => url_id_)
  end
end

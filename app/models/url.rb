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

  def self.create_url(long_url, tag, user_id)
    url = URL.new
    url.long_url = long_url
    url.user_id = user_id
    url.populate_url
    url.tag = tag
    url.save
  end

  def populate_url
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

  def num_click
    clicks.count
  end

  def unique_clicks
    user_ids = []
    clicks.each do |click|
      user_ids << click.user_id
    end
    user_ids.uniq.count
  end

  def clicks_from_ten_min
    clicks.where(:created_at => (10.minutes.ago..Time.now))
  end

  def self.list_tags
    tags = URL.pluck(:tag).uniq
  end

  def self.most_popular_stories_by_tag(tags)
    URL.where(:tag => tags).sort { |url1, url2|  url2.clicks.length <=>  url1.clicks.length }
  end

  def self.print_most_popular(tags)
    popular = URL.where(:tag => tags).sort { |url1, url2|  url2.clicks.length <=>  url1.clicks.length }
    popular.each_with_index do |story, i|
      puts "#{story.long_url} - #{story.clicks.length} clicks"
    end
  end

end

require "active_record"
require "embiggen"
require "logger"

@logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  host: "localhost",
  username: "root",
  database: "analytics",
)

class Twitter < ActiveRecord::Base
  self.table_name = "twitter"
end

class TwitterLink < ActiveRecord::Base
end

class TwitterAttribute < ActiveRecord::Base
  INTERNAL = 1
  MAGAZINE = 2
  EXTERNAL = 3
end

tweets = Twitter.pluck(:tweet_text)
shorten_links = tweets.map{|tweet| tweet.scan(%r(https?://t\.co/\w+)) }.flatten

new_shorten_links = (shorten_links - TwitterLink.pluck(:shorten_link))

new_shorten_links.each do |shorten_link|
  expand_link = Embiggen::URI(shorten_link).expand.to_s
  p TwitterLink.create!(shorten_link: shorten_link, expand_link: expand_link)
end

Twitter.where.not(tweet_id: TwitterAttribute.pluck(:tweet_id)).find_each do |twitter|
  links = twitter.tweet_text.scan(%r(https?://t\.co/\w+)).map{|link| TwitterLink.find_by(shorten_link: link).expand_link }

  if links.empty?
    link_status = nil
  elsif links.any?{|link| link =~ %r(^https?://www\.switch-science\.com) }
    link_status = TwitterAttribute::INTERNAL
  elsif links.any?{|link| link =~ %r(^https?://mag\.switch-science\.com) }
    link_status = TwitterAttribute::MAGAZINE
  else
    link_status = TwitterAttribute::EXTERNAL
  end

  @logger.info TwitterAttribute.create!(tweet_id: twitter.tweet_id, link_status: link_status)
end

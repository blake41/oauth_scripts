require 'twitter'
require 'pry'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["TOKEN"]
  config.access_token_secret = ENV["SECRET_TOKEN"]
end

tweets = client.home_timeline
binding.pry
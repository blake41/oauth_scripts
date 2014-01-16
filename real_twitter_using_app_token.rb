require 'debugger'
require 'oauth'
URL = "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=blake41"
# Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
def prepare_access_token
  consumer = OAuth::Consumer.new(ENV["CONSUMER_KEY"],ENV["CONSUMER_SECRET"],
    { :site => "http://api.twitter.com",
      :scheme => :header
    })
  # now create the access token object from passed values
  token_hash = { :oauth_token => ENV["TOKEN"],
                 :oauth_token_secret => ENV["SECRET_TOKEN"]
               }
  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  return access_token
end
 
# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
access_token = prepare_access_token
# use the access token as an agent to get the home timeline
response = access_token.request(:get, URL)
puts response.body
debugger
puts 'hi'
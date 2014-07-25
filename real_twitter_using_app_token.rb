require 'pry'
require 'oauth'
CONSUMER_KEY = "QDkFYr8YNFmGe6bLvyjQ"
CONSUMER_SECRET = "XFIq1ZZxk8ynC4Md60LoKh9pAWqCwbEoJWXnepiQhg"
ACCESS_TOKEN = "7605412-8B5MPl588TgqDUHjmPLvqVxA7hLE62IZsIaRCJkbFT"
ACCESS_TOKEN_SECRET = "FUDanehXJ5pKMzloZySznmmm3vALh5jli4LLt6Ls4k9nd"
URL = "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=blake41"
# Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
def prepare_access_token
  consumer = OAuth::Consumer.new(CONSUMER_KEY,CONSUMER_SECRET,
    { :site => "http://api.twitter.com",
      :scheme => :header
    })
  # now create the access token object from passed values
  token_hash = { :oauth_token => ACCESS_TOKEN,
                 :oauth_token_secret => ACCESS_TOKEN_SECRET
               }
  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  return access_token
end
 
# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
access_token = prepare_access_token
# use the access token as an agent to get the home timeline
response = access_token.request(:get, URL)
puts response.body
binding.pry
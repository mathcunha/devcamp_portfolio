module SocialHub
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV.fetch('API_KEY')
    config.consumer_secret     = ENV.fetch('API_SECRET_KEY')
    config.access_token        = ENV.fetch('API_ACCESS_TOKEN')
    config.access_token_secret = ENV.fetch('API_ACCESS_TOKEN_SECRET')
  end
  def self.hello
    "hello, elaine!"
  end
  def self.load_data
    @client.search("#rails", result_type: 'recent').take(3).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
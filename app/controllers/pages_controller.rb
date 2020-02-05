require 'social_hub'
class PagesController < ApplicationController
  include SocialHub
  def home
    @posts = Blog.all
  end

  def about
  end

  def contact
  end

  def tech_news
    @tweets = SocialHub.load_data
  end
end

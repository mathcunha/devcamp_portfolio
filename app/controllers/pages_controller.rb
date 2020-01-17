class PagesController < ApplicationController
  layout "cover"
  
  def home
    @posts = Blog.all
  end

  def about
  end

  def contact
  end
end

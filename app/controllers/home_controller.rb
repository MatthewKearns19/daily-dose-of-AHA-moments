class HomeController < ApplicationController
  def index
    @communities = Community.all.limit(5)
    @posts = Post.order(id: :desc).limit(10)
    @stories = client.topstories(0, 4)
  end
end

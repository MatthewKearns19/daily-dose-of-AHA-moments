class HomeController < ApplicationController
  before_action :set_breadcrumbs

  def ping
  end

  def pong
  end

  def index
    @communities = Community.all.limit(5)
    @posts = Post.order(id: :desc).limit(30)
    @stories = hacker_news_client.topstories(0, 4)
  end

  def set_cookie
    @user = User.find(current_user.id)
    cookies.permanent.signed[:first_name] = @user.first_name
    cookies.permanent.signed[:last_name] = @user.last_name
  end

  def show_cookie
    @first_name = cookies[:first_name]
    @last_name = cookies[:last_name]

  end

  def delete_cookie
    cookies.delete :first_name
    cookies.delete :last_name
  end

  def reset
    reset_session
    @breadcrumbs = nil
  end

  private
  def set_breadcrumbs
    if session[:breadcrumbs]
      @breadcrumbs = session[:breadcrumbs]
    else
      @breadcrumbs = Array.new
    end

    @breadcrumbs.push(request.url)

    if @breadcrumbs.count > 4
      @breadcrumbs.shift
    end

    session[:breadcrumbs] = @breadcrumbs
  end

end

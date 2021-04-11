class HomeController < ApplicationController
  def index
    @communities = Community.all.limit(5)
    @posts = Post.order(id: :desc).limit(10)
    @stories = hacker_news_client.topstories(0, 4)
  end

  def set_cookie
    @user = User.find(current_user.id)
    #cookies[:email] = @user.email
    #cookies[:password] = @user.password
    cookies[:first_name] = @user.first_name
    cookies[:last_name] = @user.first_name
  end

  def show_cookie
    @first_name = cookies[:first_name]
    @last_name = cookies[:last_name]

  end

  def delete_cookie
    cookies.delete :first_name
    cookies.delete :last_name
  end


end

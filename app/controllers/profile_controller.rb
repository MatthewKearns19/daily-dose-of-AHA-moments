class ProfileController < ApplicationController
  def index
  end

  def show
    # return 404 if username cant be found
    @profile = User.find_by_username!(params[:username])
    @posts = @profile.posts
  end

  def current_user_profile
    @profile = User.find(current_user.id)
    @posts = @profile.posts
  end

  def edit
  end

end

# This is a user's profile page controller
class ProfileController < ApplicationController
  def index
    #@user = User.findby_username!(params[:user_id])
    #@posts = @profile.posts
  end

  def show
    # return 404 if username cant be found
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @courses = @user.courses
    @profile = @user.profile
  end

  def current_user_profile
    @user = User.find(current_user.id)
    @posts = @user.posts
    @courses = @user.courses
    @profile = @user.profile
  end

  def edit
  end

  # this is only for creating a profile which is called
  # directly after a user is created. This is because
  # I want each user to only have one profile. So it is
  # not available to be called elswhere
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "You have succesfully signed up!"
    else
      :notice => "Unable to create profile for user"
      render :new
    end
  end

end

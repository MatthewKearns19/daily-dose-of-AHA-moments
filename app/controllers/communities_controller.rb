class CommunitiesController < ApplicationController
#load set_community by retrieving id
before_action :set_community, only: [:show]

  def index
    @communities = Community.all
  end

  def show
    @posts = @community.posts
  end

  def new
    @community = Community.new
  end

  def create
      @community = Community.new community_values
      @community.user_id = current_user.id

      if @community.save
        redirect_to communities_path
      else
        render :new
      end
  end

  def search
    # replace placeholder with the queried (:q) params
    @community = Community.where("name LIKE?", "%" + params[:query] + "%").first
    if @community
      redirect_to community_path(@community.id)
    else
      redirect_to communities_path, alert: "No Community found"
    end
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_values
    params.require(:community).permit(:name, :url, :description)
  end

end

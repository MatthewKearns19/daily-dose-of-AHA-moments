class CommunitiesController < ApplicationController
#load set_community by retrieving id
before_action :set_community, only: [:show]

  def index
    @q = Community.ransack(params[:q])
    @communities = @q.result(distinct: true)
    #@communities = Community.all
  end

  def show
    @posts = @community.posts
    @user = @community.user
  end

  def new
    @community = Community.new
  end

  def create
      @community = Community.new community_params
      @community.user_id = current_user.id

      if @community.save
        redirect_to communities_path
      else
        render :new
      end
  end

  def edit
    @community = Community.find(params[:id])
    @user = @community.user
  end

  def update
    @community = Community.find(params[:id])

    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to community_path(@community), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location:community_path(@community) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # By decision of design, Communities cannot be destroyed. This is mentioned as a warning
  # before setting up the community. Community Admins can only edit a Community after creation,
  # but not delete, as the conecpt is a space for other users to post/promot a topic or course.

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

  def community_params
    params.require(:community).permit(:name, :url, :description)
  end

end

class PostsController < ApplicationController
  #before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_post, only: %i[ :show ]

  # GET community/1/posts or community/posts.json
  def index
    @posts = Post.all
  end

  # GET community/1/posts/1 or community/posts/1.json
  def show
    @community = Community.find(params[:community_id])
    @post = @community.posts.find(params[:id])
    @user = @post.user
  end

  # GET community/1/posts/new
  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.community_id = params[:community_id]
      @community = Community.find(params[:community_id])

      if @post.save
        # redirect back to the specific community_path using the params from above
        redirect_to community_path(@community)
      else
        render :new
      end
  end

  # GET community/1/posts/1/edit
  def edit
    @community = Community.find(params[:community_id])
    @post = @community.posts.find(params[:id])
    @user = @post.user
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @community = Community.find(params[:community_id])
    @post = @community.posts.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to community_post_path(@community, @post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @community = Community.find(params[:community_id])
    @post = Post.find(params[:id])

    @post.destroy
    respond_to do |format|
      format.html { redirect_to community_path(@community), notice: "Post was successfully destroyed and is no longer available in #{@community.name}." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end

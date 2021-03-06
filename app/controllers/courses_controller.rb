class CoursesController < ApplicationController
  before_action :set_course, only: [:show]

  # GET /courses or /courses.json
  def index
    @user = User.find(params[:user_id])
    @courses = @user.courses
  end

  # GET /courses/1 or /courses/1.json
  def show
    @user = User.find(params[:user_id])
    @course = @user.courses.find(params[:id])
  end

  # GET /courses/new
  def new
    @user = User.find_by_id(current_user.id)
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @user = User.find(params[:user_id])
    @course = @user.courses.find(params[:id])
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    @user = @course.user

    if @course.save
      redirect_to profile_path(@user)
      flash[:notice] = "Course was Created."
      #format.html { redirect_to user_course_path(@user, @course), notice: "Course was created successfully." }
      #format.json { render :show, status: :ok, location: user_course_path(@user, @course) }
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    @user = User.find(params[:user_id])
    @course = @user.courses.find(params[:id])

    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to user_course_path(@user, @course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location:user_course_path(@user, @course) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @user = User.find(params[:user_id])
    @course = @user.courses.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to user_courses_path(@user), notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_name, :course_description, :course_content)
    end
end

require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    get "/users/sign_in"
    @user = users(:five)
    login_as(@user, :scope => :user)
    @course = courses(:four)
  end


  test "should get index" do
    get user_courses_url(@user)
    assert_response :success
  end

  test "should get new" do
    get new_user_course_url(@user)
    assert_response :success
  end

  test "should create course and show course, asserting the new url and course name" do
    assert_difference('Course.count') do
      # passing the user id within params before setting the course params
      post user_courses_url(@user), params: { user_id: @user.id, course: {course_name: @course.course_name, course_description: @course.course_description, course_content: @course.course_content } }
    end

    # re-direct is set up to re-direct to the users profile path, so this redirect is tested,
    # and then then new course is tested here
    assert_redirected_to profile_path(@user)
    follow_redirect!
    get user_course_url(@user, Course.last)
    assert_response :success
    # assert the new course name with the name displaying on the page
    assert_select "strong", "Course name: testString"
  end


  test "should create course, and the edit url along with the page text is asserting for that new course" do
    assert_difference('Course.count') do
      post user_courses_url(@user), params: { user_id: @user.id, course: {course_name: @course.course_name, course_description: @course.course_description, course_content: @course.course_content } }
    end

    assert_redirected_to profile_path(@user)
    follow_redirect!
    get edit_user_course_url(@user, Course.last)
    assert_response :success
    assert_select "h1", "Editing Course"
  end


  test "should create and update course" do
    assert_difference('Course.count') do
      post user_courses_url(@user), params: { user_id: @user.id, course: {course_name: @course.course_name, course_description: @course.course_description, course_content: @course.course_content } }
    end

    assert_redirected_to profile_path(@user)
    follow_redirect!
    get edit_user_course_url(@user, Course.last)
    assert_response :success

    #use this dummy course 'five' to update the global test scripts course name -> course 'four'
    new_course = courses(:five)
    patch user_course_url(@user, Course.last), params: { user_id: @user.id, course: {course_name: new_course.course_name } }
    assert_redirected_to user_course_url(@user, Course.last)
    follow_redirect!
    assert_select "strong", "Course name: newtestString"
  end

  # Positive test case for deleting is also successful when I remove the confirmation check in the course/list views
  test "should not be able to delete a course due to the warning in our views" do
    assert_difference('Course.count') do
      post user_courses_url(@user), params: { user_id: @user.id, course: {course_name: @course.course_name, course_description: @course.course_description, course_content: @course.course_content } }
    end

    assert_difference('Course.count', -1) do
      delete user_course_url(@user, Course.last)
      assert_redirected_to user_courses_url(@user)
    end
  end



  teardown do
    Warden.test_reset!
  end
end

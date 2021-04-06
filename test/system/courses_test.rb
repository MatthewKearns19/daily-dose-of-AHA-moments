require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    visit new_user_session_url
    @user = users(:five)
    login_as(@user, :scope => :user)
    @course = courses(:four)
  end

  test "visiting the index" do
    visit user_courses_url(@user)
    #fill_in "user[first_name]", with: @user.first_name, visible: all
    #fill_in "user[last_name]", with: @user.last_name, visible: all
    #fill_in "user[username]", with: @user.username, visible: all
    assert_selector "h1", text: "All courses of testfirstname", visible: :false
  end

  test "creating a Course" do
    visit user_courses_url(@user)
    click_on "New Course"

    fill_in "Course name", with: @course.course_name
    fill_in "Course Description", with: @course.course_description
    fill_in "Course Content", with: @course.course_content
    click_on "Launch New Course"

    assert_text "newtestString"
  end

  test "updating a Course" do
    new_course = courses(:five)
    visit user_course_url(@user, @course)
    click_on "Edit", match: :first

    fill_in "Course name", with: new_course.course_name
    fill_in "Course Description", with: new_course.course_description
    fill_in "Course Content", with: new_course.course_conten
    click_on "Launch New Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit user_course_url(@user, @course)
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Course was successfully destroyed"
  end

end

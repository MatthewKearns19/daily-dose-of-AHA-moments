require "test_helper"

class CourseTest < ActiveSupport::TestCase

  # negative test cases
  test "should not save a course without a user id" do
    course = courses(:four)
    assert_not course.save, "Saved a course without a user id"
  end

  test "should not save a course without a course name, description, and content" do
    user = users(:eight)
    course = Course.new
    course.user_id = user.id
    assert_not course.save, "Saved a course without a course name, description, and content"
  end

  test "should not save a course without a course name" do
    user = users(:eight)
    course = courses(:one)
    course.user_id = user.id
    assert_not course.save, "Saved a course without a course name"
  end

  test "should not save a course without  a course description" do
    user = users(:eight)
    course = courses(:two)
    course.user_id = user.id
    assert_not course.save, "Saved a course without a course description"
  end

  test "should not save a course without course content" do
    user = users(:eight)
    course = courses(:three)
    course.user_id = user.id
    assert_not course.save, "Saved a course without course content"
  end

  # positive test case
  test "should save a course with all fields containing valid data" do
    user = users(:eight)
    course = courses(:four)
    course.user_id = user.id
    assert course.save, "Could not save a course with all fields containing valid data"
  end

end

require "test_helper"

class CourseTest < ActiveSupport::TestCase

  test "should not save a course without a course name, description, and content" do
    course = Course.new
    assert_not course.save, "Saved a course without a course name, description, and content"
  end

  test "should not save a course without a course name" do
    course = courses(:one)
    assert_not course.save, "Saved a course without a course name"
  end

  test "should not save a course without  a course description" do
    course = courses(:two)
    assert_not course.save, "Saved a course without a course description"
  end

  test "should not save a course without course content" do
    course = courses(:three)
    assert_not course.save, "Saved a course without course content"
  end

end

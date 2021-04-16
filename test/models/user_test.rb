require "test_helper"

class UserTest < ActiveSupport::TestCase

  # negative test cases
  test "should not save user without any account data" do
    user = User.new
    assert_not user.save, "Saved the user without without any account data"
  end

  test "should not save user without username" do
    user = users(:one)
    assert_not user.save, "Saved the user without a username"
  end

  test "should not save user without first name" do
    user = users(:two)
    assert_not user.save, "Saved the user without a first name"
  end

  test "should not save user without last name" do
    user = users(:three)
    assert_not user.save, "Saved the user without a last name"
  end

  test "should not save user with the incorrect email format" do
    user = users(:four)
    assert_not user.save, "Saved a user with the incorrect email format"
  end

  test "should not save user without an email" do
    user = users(:six)
    assert_not user.save, "Saved a user without an email"
  end

  test "should not save user without a password" do
    user = users(:seven)
    assert_not user.save, "Saved a user without a password"
  end

  # positive test case
  test "should save user with all valid account detail fields" do
    user = users(:eight)
    assert user.save, "Clould not save user with all valid account detail fields"
  end
end

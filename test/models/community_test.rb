require "test_helper"

class CommunityTest < ActiveSupport::TestCase

  # positive test case

  test "should save a community with all fields containing valid data" do
    user = users(:eight)
    community = communities(:one)
    community.user_id = user.id
    assert community.save, "Could not save a community with all fields containing valid data"
  end


  # negative test cases

  test "should not save a community without a user id" do
    community = courses(:one)
    assert_not community.save, "Saved a community without a user id"
  end

  test "should not save a community without a community name and description" do
    user = users(:eight)
    community = Community.new
    community.user_id = user.id
    assert_not community.save, "Saved a community without a community name and description"
  end

  test "should not save a community without a community name" do
    user = users(:eight)
    community = communities(:two)
    community.user_id = user.id
    assert_not community.save, "Saved a course without a community name"
  end

  test "should not save a course without a community description" do
    user = users(:eight)
    community = communities(:three)
    community.user_id = user.id
    assert_not community.save, "Saved a community without a community description"
  end

end

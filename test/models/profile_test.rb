require "test_helper"

class ProfileTest < ActiveSupport::TestCase

  # negative test case
  test "Should not save profile without a user id" do
    profile = profiles(:one)
    assert_not profile.save, "Saved a profile without a user id"
  end

  # positive test case
  test "Save profile without profile details" do
    user = users(:eight)
    profile = Profile.new
    profile.user_id = user.id
    assert profile.save, "Saved a profile without profile details"
  end

end

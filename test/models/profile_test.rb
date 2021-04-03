require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "save profile without profile details" do
    user = User.new
    profile = user
    assert_not profile.save, "Saved a profile without profile details"
  end

end

require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest

  setup do
    get "/users/sign_in"
    @user = users(:five)
    login_as(@user, :scope => :user)

    #stop the test continuing if it fails on login
    assert_response :success
  end

  test "can see the correct username on the profile page" do
    get "/myprofile"
    assert_select "h2", "My Profile"
    assert_select "h6", "Username: testusername"
  end

  teardown do
    Warden.test_reset!
  end

end

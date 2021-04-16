require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "can see the login page redirect on root access" do
    get "/"
    assert_response :redirect
    follow_redirect!
    assert_select "h2", "Log in"
    assert_select 'label', "Email"
    assert_select 'label', "Password"
  end

  test "can see the appropriate elememnts in the user sign up page" do
    get "/users/sign_up"
    assert_select "h2", "Sign up"
    assert_select 'label', "Username"
    assert_select 'label', "First name"
    assert_select 'label', "Last name"
    assert_select 'label', "Password"
    assert_select 'label', "Password confirmation"
  end

  # Profile is set up for users so only testing devise
  # user controller on sign up and login in this test suite

end

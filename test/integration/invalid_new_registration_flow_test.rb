require "test_helper"

class InvalidNewRegistrationFlowTest < ActionDispatch::IntegrationTest
  fixtures :all

  test 'register without any user fields filled in'
    @user = users(:eight)
    get 'users/new'
    assert_response :success

    post users_url, params:{user: {last_name: @user.last_name}}
    assert_equal. 'users', path
    assert_select 'li', "Email can't be blank"
    assert_select 'li', "Password can't be blank"
    assert_select 'li', "Username can't be blank"
    assert_select 'li', "First name can't be blank"
    assert_select 'li', "Last name can't be blank"
    assert_select 'li', "Encrypted password can't be blank"
    assert_select 'li', "Username is too short (minimum is 6 characters)"
    assert_select 'li', "Email is invalid"
end

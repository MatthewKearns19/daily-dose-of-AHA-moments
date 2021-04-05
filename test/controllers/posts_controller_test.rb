require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  #https://guides.rubyonrails.org/v4.1/testing.html

  setup do
    get "/users/sign_in"
    @user = users(:five)
    #sign_in users(:five)
    login_as(@user, :scope => :user)
    @user.communities = communities(:one)

    #stop teh test contiinuing if it fails on login
    assert_response :success
  end

  teardown do
    Warden.test_reset!
  end

end

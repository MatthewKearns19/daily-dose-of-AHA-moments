require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get "/users/sign_in"
    sign_in users(:five)
    @community = communities(:one)

    #stop teh test contiinuing if it fails on login
    assert_response :success
  end
  
end

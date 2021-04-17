require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get "/users/sign_in"
    @user = users(:five)
    #sign_in users(:five)
    login_as(@user, :scope => :user)

    #stop the test continuing if it fails on the above
    assert_response :success
  end

  # I had to declare the new course for each test case as the course
  # was not being initialized in the setup above

  # no index view for posts, post are listed in a community

  test "should get new" do
    community = communities(:one)
    post communities_url, params: { community: {name: community.name, description: community.description } }
    get new_community_post_url(Community.last)
    assert_response :success
  end


  test "should create post and show course, asserting the now valid show url and course name text" do
    community = communities(:one)
    post communities_url, params: { community: {name: community.name, description: community.description } }
    @community = Community.last
    @post = posts(:one)

    assert_difference('Post.count') do
      post community_posts_url(@community), params: { community_id: (@community).id, post: {title: @post.title, body: @post.body } }
    end

    assert_redirected_to community_path(@community)
    follow_redirect!
    get community_post_url(@community, Post.last)
    assert_response :success
    assert_select "h3", "Mytitle"
  end


  test "should create post, assert the now valid edit post url, and assert text on this edit page" do
    community = communities(:one)
    post communities_url, params: { community: {name: community.name, description: community.description } }
    @community = Community.last
    @post = posts(:one)

    assert_difference('Post.count') do
      post community_posts_url(@community), params: { community_id: (@community).id, post: {title: @post.title, body: @post.body } }
    end

    assert_redirected_to community_path(@community)
    follow_redirect!
    get edit_community_post_url(@community, Post.last)
    assert_response :success
    assert_select "h2", "Edit Post"
  end


  test "should be able to create and update a post" do
    community = communities(:one)
    post communities_url, params: { community: {name: community.name, description: community.description } }
    @community = Community.last
    @post = posts(:one)

    assert_difference('Post.count') do
      post community_posts_url(@community), params: { community_id: (@community).id, post: {title: @post.title, body: @post.body } }
    end

    assert_redirected_to community_path(@community)
    follow_redirect!
    get edit_community_post_url(@community, Post.last)
    assert_response :success

    #use this dummy post 'four' to update tghe posts title
    new_post = posts(:four)
    patch community_post_url(@community, Post.last), params: { community_id: (@community).id, post: {title: new_post.title } }
    assert_redirected_to community_post_url(@community, Post.last)
    follow_redirect!
    assert_select "h3", "Mynewtitle"
  end



  # Positive test case for deleting is also successful when I remove the confirmation check in the views -> posts -> _list.html.erb
  test "should not be able to delete a course due to the warning in our views" do
    community = communities(:one)
    post communities_url, params: { community: {name: community.name, description: community.description } }
    @community = Community.last
    @post = posts(:one)

    assert_difference('Post.count') do
      post community_posts_url(@community), params: { community_id: (@community).id, post: {title: @post.title, body: @post.body } }
    end

    assert_difference('Post.count', -1) do
      delete community_post_url(@community, Post.last)
      assert_redirected_to community_path(@community)
    end
  end





  teardown do
    Warden.test_reset!
  end

end

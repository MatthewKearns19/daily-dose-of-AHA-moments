require "test_helper"

class PostTest < ActiveSupport::TestCase

  # negative test cases

  test "should not save post without a user id or community id" do
    post = posts(:one)
    assert_not post.save, "Saved the post without a user id or community id"
  end

  test "should not save post without a user id" do
    community = communities(:one)
    post = posts(:one)
    post.community_id = community.id
    assert_not post.save, "Saved the post without a user id"
  end

  test "should not save post without a community id" do
    user = users(:eight)
    post = posts(:one)
    post.user_id = user.id
    assert_not post.save, "Saved the post without a community id"
  end

  test "should not save post without title and body" do
    user = users(:eight)
    community = communities(:one)
    post = Post.new
    post.user_id = user.id
    post.community_id = community.id
    assert_not post.save, "Saved the post without a title and body"
  end

  test "should not save post without title" do
    user = users(:eight)
    community = communities(:one)
    post = posts(:two)
    post.user_id = user.id
    post.community_id = community.id
    assert_not post.save, "Saved the post without a title"
  end

  test "should not save post without body" do
    user = users(:eight)
    community = communities(:one)
    post = posts(:three)
    post.user_id = user.id
    post.community_id = community.id
    assert_not post.save, "Saved the post without a body"
  end

  # positive test case
  test "should save a post with valid field data" do
    user = users(:eight)
    community = communities(:one)
    post = posts(:one)
    post.user_id = user.id
    post.community_id = community.id
    assert post.save, "could not save a post with valid field data"
  end

end

require "test_helper"

class PostTest < ActiveSupport::TestCase

  test "should not save post without title and body" do
    post = Post.new
    assert_not post.save, "Saved the post without a title and body"
  end

  test "should not save post without title" do
    post = posts(:two)
    assert_not post.save, "Saved the post without a title"
  end

  test "should not save post without body" do
    post = posts(:three)
    assert_not post.save, "Saved the post without a body"
  end

end

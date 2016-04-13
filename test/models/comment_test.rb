require 'test_helper'
class CommentTest < ActiveSupport::TestCase
  test "comment belongs to user" do
    comment = comments(:test)
    assert_equal comment.user, users(:user)
  end
end

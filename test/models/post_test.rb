require 'test_helper'
class PostTest < ActiveSupport::TestCase
  test "verify posts don't have user_id" do
  @post = Post.new(title: "awesome cats",
                    link: "google.com")
  assert @post.valid?, "saved without a user_id"
  end

end

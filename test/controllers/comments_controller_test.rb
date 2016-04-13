require "test_helper"
class CommentsControllerTest < ActionController::TestCase
  def sign_in(user)
    session[:user_id] = users(user).id
  end
  def sign_out
    session[:user_id] = nil
  end

  test "loged in user create a comment" do
    sign_in(:user)
    assert_difference("Comment.count") do
      post :create, {
        body: "test comment"
      }
    end
    assert_redirected_to post_path(@post)
  end
end

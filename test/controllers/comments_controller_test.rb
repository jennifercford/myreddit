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
        id: posts(:google).id,
        user_id: users(:user).id,
        body: "test comment"
      }
    end
  end
  test "logged in users can delete a comment" do
    sign_in(:user)
#    binding.pry
    post :create, {
      id: posts(:google).id,
      #user_id: users(:user).id,
      body: comments(:test).body,
      }
#      binding.pry
    assert_difference("Comment.count", -1) do
      delete :destroy, {
        id: posts(:google).id,
        #user_id: users(:user).id,
        comment_id: comments(:test).id
      }
#      binding.pry
     end
  end

end

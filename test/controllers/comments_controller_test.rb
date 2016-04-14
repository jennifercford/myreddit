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
        id: comments(:test).id,
        post_id: posts(:google).id,
        user_id: users(:user).id,
        body: "test comment"
      }
    end
  end
  # test "logged in users can delete a comment" do
  #   sign_in(:user)
  #   post :create, {
  #     post_id: posts(:google).id,
  #     user_id: users(:user).id,
  #     body: comments(:test).body,
  #     }
  #   assert_difference("Comment.count") do
  #     delete :destroy, {
  #       post_id: posts(:google).id,
  #       user_id: users(:user).id,
  #       body: comments(:test).body
  #     }
  #    end
  #end

end

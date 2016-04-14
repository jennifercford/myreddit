require "test_helper"

class PostsControllerTest < ActionController::TestCase
  def sign_in(user)
    session[:user_id] = users(user).id
  end
  def sign_out
    session[:user_id] = nil
  end

  test "logged in users can veiw a new post form" do
    sign_in(:user)
    get :new
    assert_template :new
    assert_response :ok
  end
  test "can create a post " do
    sign_in(:user)
    assert_difference("Post.count") do
      post :create, {
        id: posts(:google).id,
        user_id: users(:user).id,
        title: posts(:google).title,
        link: posts(:google).link}
      end
    end
    # test "can delete a post" do
    #   sign_in(:user)
    #   post :create, {
    #     id: posts(:google).id,
    #     user_id: users(:user).id,
    #     title: posts(:google).title,
    #     link: posts(:google).link}
    #   assert_difference("Post.count") do
    #     delete :destroy, {
    #       id: posts(:google).id,
    #       user_id: users(:user).id
    #     }
    #   end
    #end
  end

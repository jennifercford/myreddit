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

  end

require "test_helper"

class ApplicationControllerTest < ActionController::TestCase
  def sign_in(user)
    session[:user_id] = users(user).id
  end

  def sign_out
    session[:user_id] = nil
  end

  test "logged in user has a session" do
    sign_in(:user)
    assert_not_nil session
  end

  test "logged out user session is nil" do
    sign_in(:user)
    sign_out
    assert_nil session
  end
end

require "test_helper"
class LoginsControllerTest < ActionController::TestCase
  test "login with valid email and password" do
    post :create, {
      email: users(:user).email,
      password: "password"
    }
  end
end

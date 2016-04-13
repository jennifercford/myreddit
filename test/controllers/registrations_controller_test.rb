require "test_helper"

class RegistrationsControllerTest < ActionController::TestCase
  test "can create a new user" do
    assert_difference("User.count") do
      post :create, {
        email: "test@email.com",
        first_name: "Jane",
        last_name: "Doe",
        password: "password"
        }
    end
    assert_redirected_to root_path
  end

  end

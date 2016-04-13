require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user passwords are encrypted" do
    password = "doodle"
    @user = User.new(email: "test@email.com",
    password: password)
    @user.save
    assert_not_nil @user.password_digest
    assert_not_equal password, @user.password_digest
  end
  # test "the truth" do
  #   assert true
  # end
end

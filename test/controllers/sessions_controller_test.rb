require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  

def valid_params
{name: "johnfoo", email: "foobar@gmail.com", password: "password92"}
end

def invalid_params
{name: "", email: "", password: ""}
end

  test "should get new" do
    get :new
    assert_response :success
  end

test "logged in success" do
end

test "log out" do
 @user = User.create valid_params
 delete :destroy, id: @user.id
 assert_nil session[:user_id]
assert_response :redirect
end

end

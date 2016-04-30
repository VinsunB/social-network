require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
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

test "create user" do
assert_difference("User.count") do
post :create, user: valid_params
end
assert_not_nil session[:user_id]
end

end

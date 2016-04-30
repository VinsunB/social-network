require 'test_helper'

class UserTest < ActiveSupport::TestCase
 ## index ###
 #1 test setup
#2 testing if user attributes saving nil  
#3 testing user attributes lengths 
##########

 #1 test setup 
def valid_params
{name: "johnfoo", email: "foobar@gmail.com", password: "password92"}
end

def invalid_params
{name: "", email: "", password: ""}
end
###

#2 testing if user attributes saving nil  
test "valid params user has name/email/password"  do
user = User.create valid_params
assert_not_nil user.name, "user saving without name"
assert_not_nil user.email, "user saving without email"
assert_not_nil user.password, "user saving without password"
end

test "save user without name" do
valid_params[:name] = nil
user = User.create valid_params
assert_not user.save, "saved without name"
end

test "save user without email" do
valid_params[:email] = nil
user = User.create valid_params
assert_not user.save, "saved without email"
end

test "save user without password" do
valid_params[:password] = nil
user = User.create valid_params
assert_not user.save, "saved without password"
end


test "invalid user params "  do
user = User.new invalid_params
assert_not user.save
end

test "valid user params "  do
user = User.new valid_params
assert user.save
end


#3 testing user attributes lengths 

test "name to short length needs to be 5 char or more" do
valid_params[:name] = 'n'
user = User.new valid_params
assert_not user.save, "name length saving under 5 char"
end

test "email to short length needs to be 10 char or more" do
valid_params[:email] = 'e'
user = User.new valid_params
assert_not user.save, "email length saving under 10 char"
end

test "password to short length needs to be 8 char or more" do
valid_params[:password] = 'pass'
user = User.new valid_params
assert_not user.save, "password length saving under 8 char"
end
###

end

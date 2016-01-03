require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  ## Failing signup attempts
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               email: "user@invalid",
                               password: "foo",
                               password_confirmation: "bar"}
    end
    assert_template 'users/new'
    assert_select 'div.alert-danger'
  end

  
  ##  Successful signup
  
  test "valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "me",
                               email: "my@self.com",
                               password: "foobarZS9",
                               password_confirmation: "foobarZS9"}
    end
    assert_template 'users/show'
    assert_not flash.empty?
  end
  
  
end

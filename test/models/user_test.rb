require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not  @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.com alice+bob@baz.cn
                         first.last@foo.jp A_US-ER@foo.bar.Ni.org]
    valid_addresses.each do | valid_address |
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
    
  end

  test "email validation should reject  invalid addresses" do
    invalid_addresses = %w[user@example,com U_SE_R_at_foo.com alice+bob@baz.
                         first.last@fo_o.jp A_US-ER@foo+bar.Ni.org]
    invalid_addresses.each do | invalid_address |
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should NOT be valid"
    end
    
  end

  
end
  

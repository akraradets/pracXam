require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "ldap_before_save" do
    user = User.new username: 'username'
    user.ldap_before_save
  end
  # test "the truth" do
  #   assert true
  # end
end

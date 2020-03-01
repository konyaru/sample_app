require 'test_helper'

class UsersActivationTest < ActionDispatch::IntegrationTest
	def setup
		@activated = users(:michael)
    @non_activated = users(:red)
	end

	test "index only activated user" do
		log_in_as(@activated)
		get users_path
		assert_select "a[href=?]", user_path(@activated)
		assert_select "a[href=?]", user_path(@non_activated), count:0
	end

	test "show only activated user" do
		log_in_as(@activated)
		get user_path(@activated)
		get user_path(@non_activated)
    assert_redirected_to root_url
  end
end

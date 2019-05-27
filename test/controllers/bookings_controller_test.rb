require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get bookings_update_url
    assert_response :success
  end

end

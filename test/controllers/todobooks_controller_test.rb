require 'test_helper'

class TodobooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get todobooks_new_url
    assert_response :success
  end

end

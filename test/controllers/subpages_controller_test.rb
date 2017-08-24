require 'test_helper'

class SubpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subpages_index_url
    assert_response :success
  end

end

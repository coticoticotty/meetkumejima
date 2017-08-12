require 'test_helper'

class ChatboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chatboxes_show_url
    assert_response :success
  end

  test "should get create" do
    get chatboxes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get chatboxes_destroy_url
    assert_response :success
  end

end

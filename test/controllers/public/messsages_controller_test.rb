require "test_helper"

class Public::MesssagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_messsages_index_url
    assert_response :success
  end

  test "should get show" do
    get public_messsages_show_url
    assert_response :success
  end

  test "should get create" do
    get public_messsages_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_messsages_destroy_url
    assert_response :success
  end
end

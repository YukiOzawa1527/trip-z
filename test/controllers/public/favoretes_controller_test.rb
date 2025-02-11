require "test_helper"

class Public::FavoretesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_favoretes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_favoretes_destroy_url
    assert_response :success
  end
end

require "test_helper"

class PostReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get post_reviews_create_url
    assert_response :success
  end

  test "should get destroy" do
    get post_reviews_destroy_url
    assert_response :success
  end
end

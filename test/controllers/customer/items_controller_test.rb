require "test_helper"

class Customer::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get customer_items_top_url
    assert_response :success
  end

  test "should get about" do
    get customer_items_about_url
    assert_response :success
  end

  test "should get index" do
    get customer_items_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_items_show_url
    assert_response :success
  end
end

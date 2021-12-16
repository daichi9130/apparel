require 'test_helper'

class ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shippings_new_url
    assert_response :success
  end

  test "should get create" do
    get shippings_create_url
    assert_response :success
  end

  test "should get destroy" do
    get shippings_destroy_url
    assert_response :success
  end

end

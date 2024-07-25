require "test_helper"

class MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get maps_index_url
    assert_response :success
  end

  test "should get //maps" do
    get maps_//maps_url
    assert_response :success
  end
end

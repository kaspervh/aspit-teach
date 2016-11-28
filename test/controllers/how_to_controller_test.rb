require 'test_helper'

class HowToControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get how_to_index_url
    assert_response :success
  end

end

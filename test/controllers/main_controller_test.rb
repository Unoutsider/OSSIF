require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get main_input_url
    assert_response :success
  end

  test "should get output" do
    get main_output_url
    assert_response :success
  end
end

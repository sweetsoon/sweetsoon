require 'test_helper'

class EmoSelectControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get emo_select_select_url
    assert_response :success
  end

  test "should get processing" do
    get emo_select_processing_url
    assert_response :success
  end

end

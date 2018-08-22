require 'test_helper'

class ChocolatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chocolate = chocolates(:one)
  end

  test "should get index" do
    get chocolates_url
    assert_response :success
  end

  test "should get new" do
    get new_chocolate_url
    assert_response :success
  end

  test "should create chocolate" do
    assert_difference('Chocolate.count') do
      post chocolates_url, params: { chocolate: { content: @chocolate.content, title: @chocolate.title } }
    end

    assert_redirected_to chocolate_url(Chocolate.last)
  end

  test "should show chocolate" do
    get chocolate_url(@chocolate)
    assert_response :success
  end

  test "should get edit" do
    get edit_chocolate_url(@chocolate)
    assert_response :success
  end

  test "should update chocolate" do
    patch chocolate_url(@chocolate), params: { chocolate: { content: @chocolate.content, title: @chocolate.title } }
    assert_redirected_to chocolate_url(@chocolate)
  end

  test "should destroy chocolate" do
    assert_difference('Chocolate.count', -1) do
      delete chocolate_url(@chocolate)
    end

    assert_redirected_to chocolates_url
  end
end

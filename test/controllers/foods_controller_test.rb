require "test_helper"

class FoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @current_user = users(:one)
    @current_user.add_role :admin
    @food = foods(:one)
  end

  test "should get index" do
    get foods_url
    assert_response :success
  end

  test "should get new" do
    get new_food_url
    assert_response :success
  end

  test "should create food" do
    @current_user = users(:one)
    @current_user.add_role :admin

    assert_difference('Food.count') do
      post foods_url, params: { food: { description: @food.description, price: @food.price, title: @food.title } }
    end

    assert_redirected_to food_url(Food.last)
  end

  test "should show food" do
    get food_url(@food)
    assert_response :success
  end

  test "should get edit" do
    @current_user = users(:one)
    @current_user.add_role :admin

    get edit_food_url(@food)
    assert_response :success
  end

  test "should update food" do
    @current_user = users(:one)
    @current_user.add_role :admin

    patch food_url(@food), params: { food: { description: @food.description, price: @food.price, title: @food.title } }
    assert_redirected_to food_url(@food)
  end

  test "should destroy food" do
    @current_user = users(:one)
    @current_user.add_role :admin

    assert_difference('Food.count', -1) do
      delete food_url(@food)
    end

    assert_redirected_to foods_url
  end


end

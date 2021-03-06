require 'test_helper'

class DrinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drink = drinks(:one)
    @current_user = users(:one)
    @current_user.add_role :admin
  end

  test 'should get index' do
    get drinks_url
    assert_response :success
  end


  test 'should create drink' do

    assert_difference('Drink.count') do
      post drinks_url, params: { drink: { description: @drink.description, price: @drink.price, title: @drink.title } }
    end

    assert_redirected_to drink_url(Drink.last)
  end

  test 'should show drink' do
    get drink_url(@drink)
    assert_response :success
  end

  test 'should get edit' do
    get edit_drink_url(@drink)
    assert_response :success
  end

  test 'should update drink' do
    patch drink_url(@drink), params: { drink: { description: @drink.description, price: @drink.price, title: @drink.title } }
    assert_response :success
  end

  test 'should destroy drink' do
    @current_user = users(:one)
    @current_user.add_role :admin

    assert_difference('Drink.count', -1) do
      delete drink_url(@drink)
    end

  end
end

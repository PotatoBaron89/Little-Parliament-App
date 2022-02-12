require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @current_user = users(:one)
    @current_user.add_role :admin
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  test 'should create product' do
    @current_user = users(:one)
    @current_user.add_role :admin

    assert_difference('Product.count') do
      post products_url, params: { product: { description: 'description here', price: '22.45', title: 'Soaps' } }
    end
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
  end

  test 'should get edit' do
    @current_user = users(:one)
    @current_user.add_role :admin

    get edit_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    @current_user = users(:one)
    @current_user.add_role :admin

    patch product_url(@product), params: { product: { description: @product.description, price: @product.price, title: @product.title } }
    assert_redirected_to product_url(@product)
  end

  test 'should destroy product' do
    @current_user = User.create(email: 'test@tester.com', password: 'password')
    @current_user.add_role :admin
    binding.irb

    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end
  end
end

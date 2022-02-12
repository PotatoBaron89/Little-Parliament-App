require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'Products can be properly created' do
    product = Product.create!(title: 'Whale plushie', description: 'Its a plushie', price: 22.55)
    assert product.price == 22.55
    assert product.title == 'Whale plushie'
    assert product.description = 'Its a plushie'

    # Two product items by default in YML, + 1 from above
    assert Product.count == 3
  end

  test 'Products can be deleted' do
    assert Product.count == 2
    Product.last.delete
    assert Product.count == 1
  end

  test 'Values of product can be changed and saved' do
    assert_not Product.last.title == 'Not a product'
    product = Product.last
    product.title = 'Not a product'
    product.save
    assert Product.last.title == 'Not a product'
  end

  test 'Products with the same title cannot save' do
    Product.create(title: 'Not a product', price: 2.55)
    new_product = Product.new(title: 'Not a product', price: 3.25)
    assert_not new_product.valid?
  end

  test 'Products without a price cannot be saved' do
    new_product = Product.new(title: 'Priceless Product', description: 'Too good to put a price on')
    assert_not new_product.valid?
  end

  test 'Price cannot be negative' do
    new_product = Product.new(title: 'Latte', price: -2.55)
    assert_not new_product.valid?
    new_product.price = 2.55
    assert new_product.valid?
  end
  
  test 'Default fields filled in if left blank' do
    new_product = Product.create!(title: 'Test product', price: 29.99)
    assert new_product.featured == false
    assert new_product.qty == 1
  end
end

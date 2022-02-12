require "test_helper"

class FoodTest < ActiveSupport::TestCase
  test 'Foods can be properly created' do
    food = Food.create!(title: 'Croissant', description: 'Extra tasty Croissant', price: 3.45)
    assert food.price == 3.45
    assert food.title == 'Croissant'
    assert food.description = 'Extra tasty Croissant'

    # Two food items by default in YML, + 1 from above
    assert Food.count == 3
  end

  test 'Foods can be deleted' do
    assert Food.count == 2
    Food.last.delete
    assert Food.count == 1
  end

  test 'Values of food can be changed and saved' do
    assert_not Food.last.title == 'Not a food'
    food = Food.last
    food.title = 'Not a food'
    food.save
    assert Food.last.title == 'Not a food'
  end

  test 'Foods with the same title cannot save' do
    Food.create(title: 'Not a food', price: 2.55)
    new_food = Food.new(title: 'Not a food', price: 3.25)
    assert_not new_food.valid?
  end

  test 'Foods without a price cannot be saved' do
    new_food = Food.new(title: 'Priceless Food', description: 'Too good to put a price on')
    assert_not new_food.valid?
  end

  test 'Price cannot be negative' do
    new_food = Food.new(title: 'Raisin Toast', price: -2.55)
    assert_not new_food.valid?
    new_food.price = 2.55
    assert new_food.valid?
  end
end

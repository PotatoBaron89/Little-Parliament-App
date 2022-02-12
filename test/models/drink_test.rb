require 'test_helper'

class DrinkTest < ActiveSupport::TestCase
  test 'Drinks can be properly created' do
    drink = Drink.create!(title: 'Orange Juice', description: 'Orange Juice', price: 2.45)
    assert drink.price == 2.45
    assert drink.title == 'Orange Juice'
    assert drink.description = 'Orange Juice'

     # Two drinks by default in YML, + 1 from above
    assert Drink.count == 3
  end

  test 'Drinks can be deleted' do
    assert Drink.count == 2
    Drink.last.delete
    assert Drink.count == 1
  end

  test 'Values of drink can be changed and saved' do
    assert_not Drink.last.title == 'Not a drink'
    drink = Drink.last
    drink.title = 'Not a drink'
    drink.save
    assert Drink.last.title == 'Not a drink'
  end

  test 'Drinks with the same title cannot save' do
    Drink.create(title: 'Not a drink', price: 2.22)
    new_drink = Drink.new(title: 'Not a drink', price: 3.25)
    assert_not new_drink.valid?
  end

  test 'Drinks without a price cannot be saved' do
    new_drink = Drink.new(title: 'Priceless Drink', description: 'Too good to put a price on')
    assert_not new_drink.valid?
  end

  test 'Price cannot be negative' do
    new_drink = Drink.new(title: 'Latte', price: -2.55)
    assert_not new_drink.valid?
    new_drink.price = 2.55
    assert new_drink.valid?
  end
end

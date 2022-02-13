class Food < ApplicationRecord
  after_initialize :init                                                    # set defaults if not provided
  
  has_one_attached :image
  enum category: %i[vegan vegetarian standard]                              # enums for types and category of food
  enum meal_category: %i[any breakfast lunch dinner]

  validates_presence_of :title                                              # ensure title present and unique
  validates_uniqueness_of :title

  validates_presence_of :price
  validates :price, numericality: { greater_than_or_equal_to: 0 }           # Ensure price is not negative, and price is present

  # set default values if they aren't specified when created
  def init
    self.category ||= 'standard'
    self.meal_category ||= 'any'
  end
end

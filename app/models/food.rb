class Food < ApplicationRecord
  after_initialize :init
  
  has_one_attached :image
  enum category: %i[vegan vegetarian standard]
  enum meal_category: %i[any breakfast lunch dinner]

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :price
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def init
    self.category ||= 'standard'
    self.meal_category ||= 'any'
  end
end

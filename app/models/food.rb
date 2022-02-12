class Food < ApplicationRecord
  has_one_attached :image
  enum category: %i[vegan vegetarian standard]

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :price
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

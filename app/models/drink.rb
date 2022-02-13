class Drink < ApplicationRecord
  has_one_attached :image
  enum category: %i[cold hot alchohol]                                # enum for types of drinks

  validates_presence_of :title
  validates_uniqueness_of :title                                       # every item must have a unique title

  validates_presence_of :price                                        # every item must have a price
  validates :price, numericality: { greater_than_or_equal_to: 0 }     # price can't be negative
end

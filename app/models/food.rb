class Food < ApplicationRecord
  has_one_attached :image

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :price
end

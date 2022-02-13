
class Product < ApplicationRecord
  include SellableConcern
  after_initialize :init                # set defaults if not provided

  has_one_attached :image
  # has_many :order         need to create a join table, future feature

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :price
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates :sale_percent, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_percent, numericality: { less_than_or_equal_to: 99 }  # 100 would = free

  # return a clean version of the sale %
  def sale_percentage
    "#{sale_percent}%"
  end

  # calculate the discounted price
  def discounted_price
    # For some reason it keeps rounding to 0 if I remove any of the to_f's... Don't remove them
    ActionController::Base.helpers.number_to_currency((price.to_f * (1 - (sale_percent.to_f / 100).to_f)).to_f)
  end

  private

  # set default values if they aren't specified when created
  def init
    self.featured ||= false
    self.qty ||= 1
    self.sale_percent ||= 0
  end
end

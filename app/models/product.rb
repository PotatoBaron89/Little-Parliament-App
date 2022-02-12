
class Product < ApplicationRecord
  include SellableConcern
  after_initialize :init

  has_one_attached :image
  has_one :order


  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :price
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates :sale_percent, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_percent, numericality: { less_than_or_equal_to: 99 }  # 100 would = free

  def sale_percentage
    "#{sale_percent}%"
  end

  def discounted_price
    # For some reason it keeps rounding to 0 if I remove any of the to_f's... Don't remove them
    ActionController::Base.helpers.number_to_currency((price.to_f * (1 - (sale_percent.to_f / 100).to_f)).to_f)
  end

  private

  def init
    self.featured ||= false
    self.qty ||= 1
    self.sale_percent ||= 0
  end
end

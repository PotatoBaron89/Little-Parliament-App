module SellableConcern
  extend ActiveSupport::Concern

  def pretty_price
    ActionController::Base.helpers.number_to_currency(price)
  end
  
  def discount_by(percentage)
    # For some reason it keeps rounding to 0 if I remove any of the to_f's... Don't remove them
    ActionController::Base.helpers.number_to_currency((price.to_f * (1 - (percentage.to_f / 100).to_f)).to_f)
  end
end

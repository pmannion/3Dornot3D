class CreditItem < ActiveRecord::Base
  attr_accessible :credit_id, :product_id, :product
 belongs_to :product
 belongs_to :credit

 belongs_to :trade
 belongs_to :user

  def credit_total
    product.buy_price * quantity
  end
end

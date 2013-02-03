class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  belongs_to :credit

  def total_price
    product.price * quantity
  end
end

class Order < ActiveRecord::Base
  attr_accessible :image_url, :address, :email, :name, :pay_type, :user_id
  has_many :line_items, dependent: :destroy

  belongs_to :user

  PAYMENT_TYPES = ["check", "credit card", "voucher"]

  validates  :name, :address, :email , :presence => true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
    item.cart_id = nil
    line_items << item
    end
  end

end

class Trade < ActiveRecord::Base
  attr_accessible :address, :email, :name, :user_id, :trade_status, :request_id
  validates :name, :address, :trade_status, :email,:user_id, presence: true
  has_many :credit_items, dependent: :destroy

  belongs_to :user


  STATUS_TYPES = ["confirmed", "cancelled"]


  def add_credit_items_from_credit(credit)
    credit.credit_items.each do |item|
      item.credit_id = nil
      credit_items << item
    end
  end
end



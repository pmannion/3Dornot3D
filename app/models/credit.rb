class Credit < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :credit_items, dependent: :destroy
  belongs_to :user
  belongs_to :trade

  def add_credit(product_id)
    latest_item = credit_items.find_by_product_id(product_id)
    if latest_item
      latest_item.quantity += 1
    else
      latest_item = credit_items.build(product_id: product_id)
    end
    latest_item
  end

  def credit_total
    credit_items.to_a.sum { |credit| credit.credit_total}

  end
end

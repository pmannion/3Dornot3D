class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items,  dependent: :destroy


  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum  { |item| item.total_price}
  end


  # 10% discount function - finds 10% value of cart if total price is €60 or more
  def promo

    if total_price >= 60.00
      total_price / 100.0 * 10.0

    else
      0.00

    end
  end

  def grand_total
      if promo
        total_price - promo
      else
        line_items.to_a.sum  { |item| item.total_price}

      end
    end

end

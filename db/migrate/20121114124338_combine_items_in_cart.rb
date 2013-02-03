class CombineItemsInCart < ActiveRecord::Migration
  def up
    # replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)

     sums.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          cart.line_items.where(product_id: product_id).delete_all

        # replace with a single item
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # split items with quantity>1 into multiple items
    LineItem.where("quantity>1").each do |line_item|
# add individual items
   line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id,
                        product_id: line_item.product_id
        end

       # remove original item
       line_item.destroy
    end
  end


  def up_credit
    # replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart_credit|
      # count the number of each product in the cart
      sums_credit = cart_credit.credit_items.group(:product_id).sum(:quantity)

      sums_credit.each do |product_id_credit, quantity_credit|
        if quantity_credit > 1
          # remove individual items
          cart_credit.credit_items.where(product_id: product_id_credit).delete_all

          # replace with a single item
          credit = cart_credit.credit_items.build(product_id: product_id_credit)
          credit.quantity = quantity
          credit.save!
        end
      end
    end
  end

  def down_credit
    # split items with quantity>1 into multiple items
    CreditItem.where("quantity>1").each do |credit_item|
# add individual items
      credit_item.quantity.times do
        CreditItem.create cart_id: credit_item.cart_id,
                        product_id: credit_item.product_id
      end

      # remove original item
      credit_item.destroy
    end
  end
end
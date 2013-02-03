class CombineItemsInCredit < ActiveRecord::Migration
  def up
    Credit.all.each do |credit|
      sums = credit.credit_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          credit.credit_items.where(product_id: product_id).delete_all
          credit.credit_items.create(product_id: product_id, quantity: quantity)
        end
      end
    end
  end



  def down
    CreditItem.where("quantity>1").each do |credit_item|
      credit_item.quantity.times do
        CreditItem.create credit_id: credit_item.credit_id,
                          product_id: credit_item.product_id, quantity: 1
      end
      credit_item.destroy
  end
 end
end





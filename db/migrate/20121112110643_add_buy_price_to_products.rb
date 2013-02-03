class AddBuyPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :buy_price, :float
  end
end

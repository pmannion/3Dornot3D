class AddOrderIdToCreditItem < ActiveRecord::Migration
  def change
    add_column :credit_items, :order_id, :integer
  end
end

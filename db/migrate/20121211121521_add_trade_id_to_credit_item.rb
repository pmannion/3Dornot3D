class AddTradeIdToCreditItem < ActiveRecord::Migration
  def change
    add_column :credit_items, :trade_id, :integer
  end
end

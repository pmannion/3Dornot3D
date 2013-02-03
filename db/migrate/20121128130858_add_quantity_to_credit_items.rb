class AddQuantityToCreditItems < ActiveRecord::Migration
  def change
    add_column :credit_items, :quantity, :integer, default: 1
  end
end

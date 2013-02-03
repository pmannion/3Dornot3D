class AddWantedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :wanted, :string
  end
end

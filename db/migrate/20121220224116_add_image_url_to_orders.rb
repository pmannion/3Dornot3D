class AddImageUrlToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :image_url, :string
  end
end

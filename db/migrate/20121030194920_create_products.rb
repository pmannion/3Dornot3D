class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.string :rating
      t.string :stock_status
      t.decimal :price, :precision => 8, :scale => 2
      t.string :image_url
      t.string :wanted
      t.decimal :buy_price , :precision => 8, :scale => 2

      t.timestamps
    end
  end
  def self.down
    drop_table :products
  end
end

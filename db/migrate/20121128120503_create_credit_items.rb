class CreateCreditItems < ActiveRecord::Migration
  def change
    create_table :credit_items do |t|
      t.integer :product_id
      t.integer :credit_id

      t.timestamps
    end
  end
end

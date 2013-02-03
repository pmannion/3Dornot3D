class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :name
      t.text :address
      t.string :email


      t.timestamps
    end
  end
end

class AddTradeStatusToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :trade_status, :string
    add_column :trades, :default, :string
    add_column :trades, :=, :string
  end
end

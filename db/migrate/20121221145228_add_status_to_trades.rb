class AddStatusToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :trade_status, :string, :default => "pending"
  end

  end



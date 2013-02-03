class AddRequestIdToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :request_id, :string
  end
end

class AddCreditAvailableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credit_available, :float
  end
end

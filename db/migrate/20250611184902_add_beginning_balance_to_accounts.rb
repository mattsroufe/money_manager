class AddBeginningBalanceToAccounts < ActiveRecord::Migration[8.0]
  def change
   add_column :accounts, :beginning_balance, :decimal, precision: 10, scale: 2, null: false, default: 0.0
  end
end

class DropStringDateFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :string_date, :string, limit: 10
  end
end

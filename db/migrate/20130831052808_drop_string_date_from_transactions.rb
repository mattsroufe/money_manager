class DropStringDateFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :string_date, :string, limit: 10
  end
end

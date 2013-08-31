class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :trans_type, limit: 20
      t.string :details, limit: 40
      t.string :particulars, limit: 20
      t.string :code, limit: 20
      t.string :reference, limit: 20
      t.decimal :amount, precision: 10, scale: 2
      t.string :string_date, limit: 10
      t.date :date

      t.timestamps
    end
  end
end

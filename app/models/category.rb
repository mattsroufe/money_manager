class Category < ActiveRecord::Base
  has_many :transactions

  def income
    transactions.income
  end
end

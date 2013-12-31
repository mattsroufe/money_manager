class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :transactions

  def income
    transactions.income
  end
end

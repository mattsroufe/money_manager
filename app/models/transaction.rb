class Transaction < ActiveRecord::Base
  attr_accessible :trans_type, :details, :particulars, :code, :reference, :amount, :date
  belongs_to :category
  delegate :name, :to => :category, :prefix => true

  def self.import(file)
    CSV.foreach(file.path, :row_sep => :auto, :col_sep => ",") do |row|
      Transaction.create! :trans_type  => row[0],
                          :details     => row[1],
                          :particulars => row[2],
                          :code        => row[3],
                          :reference   => row[4],
                          :amount      => row[5],
                          :date        => row[6]
    end
  end

  def self.daily_balances
    transactions = Transaction.group(:date).sum(:amount)
    balance = 0
    transactions.each do |date, value|
      transactions[date] = balance += value
    end
  end

  # def self.monthly_balances
  #   transactions = Transaction.group("YEAR(date)").group("MONTH(date)").sum(:amount)
  # end  
end

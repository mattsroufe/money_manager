class Transaction < ActiveRecord::Base
  attr_accessible :trans_type, :details, :particulars, :code, :reference, :amount, :date, :category_id
  belongs_to :category
  delegate :name, :to => :category, :prefix => true, :allow_nil => true

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

  def self.monthly_balances
    transactions = Transaction.group("YEAR(date)").group("MONTH(date)").sum(:amount)
    balance = 0
    # Hash[transactions.map { |k, v| [Date.new(k[0],k[1]).end_of_month, balance += v] }]
    transactions.map { |k, v| [Date.new(k[0],k[1]).end_of_month, balance += v] }
  end

  def self.monthly_cashflow
    transactions = Transaction.group("YEAR(date)").group("MONTH(date)").sum(:amount)
    transactions.map { |k, v| [k[1], v] }
  end

  def self.search(search)
    if search
      where('details LIKE ?', "%#{search}%")
    else
      Transaction.all
    end
  end
end

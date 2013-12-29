class Transaction < ActiveRecord::Base
  attr_accessible :trans_type, :details, :particulars, :code, :reference, :amount, :date, :category_id
  belongs_to :category
  delegate :name, :to => :category, :prefix => true, :allow_nil => true
  scope :income, -> { where("amount > 0") }

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

  def self.on_or_after(date)
    where('date >= ?', date)
  end

  def self.on_or_before(date)
    where('date < ?', date.tomorrow)
  end

  def self.between(dates = {})
    begin
      start_date = dates[:start_date].to_date if dates[:start_date]
      end_date = dates[:end_date].to_date if dates[:end_date]
    rescue
      raise ArgumentError, "Invalid Date"
    else
      return on_or_after(start_date).on_or_before(end_date) if start_date && end_date
      return on_or_after(start_date) if start_date
      return on_or_before(end_date) if end_date
      all
    end
  end

  def self.for_month_of(date)
    between(:start_date => date.beginning_of_month, :end_date => date.end_of_month)
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

  def self.by_category(category)
    return Transaction.where(:category_id => category) if category.present?
    all
  end
end

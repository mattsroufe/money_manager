class BudgetsController < ApplicationController
  def show
    hash = {}
    transactions = Transaction.includes(:category).
      where("date >= ?", (Date.today - 1.year).beginning_of_month.beginning_of_month).
      where("date < ?", Date.today.beginning_of_month).
      group("YEAR(date)", "MONTH(date)", :name).
      sum(:amount)
    transactions.each do |transaction|
      month = Date::MONTHNAMES[transaction[0][1]]
      hash[month] ||= {}
      hash[month][transaction[0][2]] = transaction[1]
    end
    @transactions = hash
    @categories = Category.pluck(:name)
  end
end

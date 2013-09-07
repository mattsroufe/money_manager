class CashflowsController < ApplicationController
  def index
    @data = Transaction.monthly_balances
    @cashflow = Transaction.monthly_cashflow
  end
end

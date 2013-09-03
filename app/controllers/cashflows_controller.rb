class CashflowsController < ApplicationController
  def index
    @data = Transaction.monthly_balances
  end
end

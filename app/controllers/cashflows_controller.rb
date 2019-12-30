class CashflowsController < ApplicationController
  def index
    @data = Txn.monthly_balances
    @cashflow = Txn.monthly_cashflow
  end
end

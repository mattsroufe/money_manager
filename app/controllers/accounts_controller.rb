class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
    @txns = @account.txns.search(params[:search]).between(start_date: params[:start_date], end_date: params[:end_date]).by_category(params[:category_id]).order("date DESC, amount DESC")
  end
end

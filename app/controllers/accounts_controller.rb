class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
    @txns = @account.txns.search(params[:search]).by_category(params[:category_id]).order("date DESC, amount DESC")
  end
end

class TxnsController < ApplicationController
  before_action :set_txn, only: [:show, :edit, :update, :destroy]

  def index
    @txns = Txn.search(params[:search]).by_category(params[:category_id]).order("date DESC, amount DESC")
  end

  def show
  end

  # GET /txns/new
  def new
    @transaction = Txn.new
  end

  # GET /txns/1/edit
  def edit
  end

  # POST /txns
  # POST /txns.json
  def create
    @transaction = Txn.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Txn was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /txns/1
  # PATCH/PUT /txns/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Txn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /txns/1
  # DELETE /txns/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to txns_url }
      format.json { head :no_content }
    end
  end

  def import
    Txn.import(params[:file])
    redirect_to root_url, notice: "Txns imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_txn
      @transaction = Txn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:trans_type, :details, :particulars, :code, :reference, :amount, :date, :category_id)
    end
end

require 'spec_helper'

describe BudgetsController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end

    it "assigns the last 12 months to @months" do
      Time.stub(:now).and_return(Date.new(2013,12,12))
      get 'show'
      expect(assigns(:months)).to eq(["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
    end
  end

end

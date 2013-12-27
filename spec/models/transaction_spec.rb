require 'spec_helper'

describe Transaction do
  it "is valid with valid information" do
  	FactoryGirl.create(:transaction)
  end

  describe ".by_category" do
    it "returns all transactions with no params" do
      expect(Transaction.by_category(nil)).to eq(Transaction.all)
    end

    it "returns all transactions for the given category if present" do
    end
  end
end

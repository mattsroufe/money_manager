require 'spec_helper'

describe Transaction do
  it "is valid with valid information" do
  	FactoryGirl.create(:transaction)
  end
end

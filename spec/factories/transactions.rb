# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    date "2013-06-30"
    details "MyString"
    amount 1.5
  end
end

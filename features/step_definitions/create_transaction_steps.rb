Given(/^I enter valid information into the new transaction form$/) do
  visit transactions_path
  click_link "New Transaction"
  # select "1980", :from => "transaction[date(1i)]"
  fill_in "Description", :with => "Store"
  fill_in "Debit", :with => "10"
end

When(/^I add the transaction$/) do
  pending # express the regexp above with the code you wish you had
  # click_button "Save"
end

Then(/^the transaction should be saved in my transaction register$/) do
  pending # express the regexp above with the code you wish you had
end
When /^I search for a widget with "([^"]*)"$/ do |query|
  @results = Widget.search do
    keywords query
  end.results
end

Then /^I should receive no results$/ do
  @results.should be_empty
end

Then /^I should receive the results$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

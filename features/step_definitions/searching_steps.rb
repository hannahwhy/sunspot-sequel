When /^I search for a (\w+) with "([^"]*)"$/ do |model_name, query|
  model = model_name.constantize

  @results = model.search do
    keywords query
  end.results
end

Then /^if I search for a (\w+) with "([^"]*)"$/ do |model_name, query|
  When %Q{I search for a #{model_name} with "#{query}"}
end

Then /^I should receive no results$/ do
  @results.should be_empty
end

Then /^I should receive the results$/ do |table|
  actual = @results.map do |result|
    table.headers.inject({}) do |row, header|
      row.update(header => result.send(header))
    end
  end

  table.diff!(actual)
end

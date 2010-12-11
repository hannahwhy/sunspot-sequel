When /^I search for a widget with "([^"]*)"$/ do |query|
  @results = Widget.search do
    keywords query
  end.results
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

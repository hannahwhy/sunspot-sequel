When /^I index that (\w+)$/ do |model_name|
  @objects[model_name].index
end

When /^I index that (\w+) and commit changes$/ do |model_name|
  @objects[model_name].index!
end

Then /^(?:if )?I call Sunspot\.commit$/ do
  Sunspot.commit
end

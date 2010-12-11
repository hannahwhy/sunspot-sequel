When /^I index that widget$/ do
  @widget.index
end

When /^I index that widget and commit changes$/ do
  @widget.index!
end

Then /^if I call Sunspot\.commit$/ do
  Sunspot.commit
end

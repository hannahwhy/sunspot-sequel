Given /^a widget with the attributes$/ do |table|
  @widget = Widget.new(table.hashes.first)
end

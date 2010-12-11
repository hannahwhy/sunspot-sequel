Given /^a (\w+) with the attributes$/ do |model_name, table|
  model = model_name.constantize

  @objects[model_name] = model.create(table.hashes.first)
end

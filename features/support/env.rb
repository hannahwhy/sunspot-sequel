$:.unshift(File.expand_path('../../lib', __FILE__))

require 'sequel'
require 'sequel/plugins/sunspot'

DB = Sequel.sqlite

DB.create_table :widgets do
  Integer :id, :primary_key => true
  String :name
  String :description
end

DB.create_table :gadgets do
  Integer :id, :primary_key => true
  String :name
  String :distraction
end

class Widget < Sequel::Model
  plugin :sunspot

  searchable do
    text :name, :description
  end
end

class Gadget < Sequel::Model
  plugin :sunspot

  searchable do
    text :name
    string :distraction
  end
end

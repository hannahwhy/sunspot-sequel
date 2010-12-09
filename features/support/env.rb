$:.unshift(File.expand_path('../../lib', __FILE__))

require 'sequel'
require 'sequel/plugins/sunspot'

DB = Sequel.sqlite

DB.create_table :widgets do
  String :name
  String :description
end

class Widget < Sequel::Model
  plugin :sunspot
end

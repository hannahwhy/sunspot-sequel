$:.push File.expand_path('../lib', __FILE__)

require 'sequel/plugins/sunspot'
require 'rspec'
require 'sequel'

DB = Sequel.sqlite

DB.create_table(:widgets) do |t|
  Integer :id, :primary_key => true
end

class Widget < Sequel::Model
  plugin :sunspot
end

RSpec.configure do |c|

end

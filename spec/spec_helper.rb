$:.push File.expand_path('../lib', __FILE__)

require 'sequel/plugins/sunspot'
require 'rspec'
require 'sequel'

DB = Sequel.sqlite

class Widget < Sequel::Model
  plugin :sunspot
end

RSpec.configure do |c|

end

$:.push File.expand_path('../lib', __FILE__)

require 'rspec'
require 'sequel'

DB = Sequel.sqlite

class Widget < Sequel::Model
end

RSpec.configure do |c|

end

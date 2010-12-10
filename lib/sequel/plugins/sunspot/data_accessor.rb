require 'sunspot'

module Sequel::Plugins::Sunspot
  class DataAccessor < ::Sunspot::Adapters::InstanceAdapter
    def id
      @instance.pk
    end
  end
end

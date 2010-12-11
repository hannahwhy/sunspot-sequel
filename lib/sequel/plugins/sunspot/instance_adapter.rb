module Sequel::Plugins::Sunspot
  class InstanceAdapter < ::Sunspot::Adapters::InstanceAdapter
    def id
      @instance.pk
    end
  end
end

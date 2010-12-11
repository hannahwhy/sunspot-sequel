require 'sunspot'

module Sequel::Plugins::Sunspot
  class DataAccessor < ::Sunspot::Adapters::DataAccessor
    def load(id)
      @clazz[id]
    end

    def load_all(ids)
      @clazz.where(@clazz.primary_key => ids)
    end
  end
end

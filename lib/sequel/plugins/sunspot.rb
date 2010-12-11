require 'sequel/plugins/sunspot/data_accessor'
require 'sequel/plugins/sunspot/instance_adapter'
require 'sequel/plugins/sunspot/instance_methods'

module Sequel
  module Plugins
    module Sunspot
      ##
      # Registers a Sunspot data accessor and instance adapter.
      #
      # This method is executed the first time this plugin is loaded for a
      # model, unless the plugin was previously loaded by an ancestor class.
      #
      # This is required by Sequel's plugin interface.
      #
      # @param [Sequel::Model] model the model class
      # @param [Array] *args additional arguments
      def self.apply(model, *args, &block)
        ::Sunspot::Adapters::DataAccessor.register(Sunspot::DataAccessor, Sequel::Model)
        ::Sunspot::Adapters::InstanceAdapter.register(Sunspot::InstanceAdapter, Sequel::Model)
      end

      ##
      # Called every time the `plugin` method of `Sequel::Model` is called.
      def self.configure(model, *args, &block)
      end
    end
  end
end

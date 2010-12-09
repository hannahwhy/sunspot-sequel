module Sequel
  module Plugins
    module Sunspot
      ##
      # Executed the first time this plugin is loaded for a model, unless
      # the plugin was previously loaded by an ancestor class.
      #
      # This is required by Sequel's plugin interface.
      #
      # @param [Sequel::Model] model the model class
      # @param [Array] *args additional arguments
      def self.apply(model, *args, &block)
      end

      ##
      # Called every time the `plugin` method of `Sequel::Model` is called.
      def self.configure(model, *args, &block)
      end
    end
  end
end

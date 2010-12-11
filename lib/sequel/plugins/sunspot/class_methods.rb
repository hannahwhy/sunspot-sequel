module Sequel::Plugins::Sunspot
  ##
  # This module extends Sequel::Model and its subclasses with methods for
  # setting up indexing.
  #
  # This module is meant to be used by `Sequel::Model.plugin`.
  module ClassMethods
    ##
    # Marks a model for Solr indexing, and optionally describes how to index the
    # model.
    #
    # Multiple invocations of {#searchable} have a cumulative effect.
    #
    # @return [void]
    def searchable(&block)
      ::Sunspot.setup(self, &block)
    end

    ##
    # Executes `Sunspot.search` on instances of the model that extends this
    # module.
    def search(&block)
      ::Sunspot.search(self, &block)
    end
  end
end

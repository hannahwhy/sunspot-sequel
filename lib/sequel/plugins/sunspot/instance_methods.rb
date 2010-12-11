module Sequel::Plugins::Sunspot
  ##
  # Instance methods mixed into every model class that uses the Sunspot
  # plugin.
  #
  # This module is meant to be used by `Sequel::Model.plugin`.
  module InstanceMethods
    ##
    # Indexes a model without committing changes to the Solr index.
    #
    # To commit changes, follow an invocation of {#index} with
    # `Sunspot.commit` or use {#index!} on its own.
    #
    # @return [void]
    def index
      ::Sunspot.index(self)
    end

    ##
    # Indexes a model and commits changes to the Solr index.
    #
    # If you're indexing many records at a time, it's usually more
    # time-efficient to use {#index} on each record and then call
    # `Sunspot.commit`.
    def index!
      ::Sunspot.index!(self)
    end
  end
end

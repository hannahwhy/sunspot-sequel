require 'spec_helper'

module Sequel::Plugins
  describe Sunspot do
    let(:model) { Widget.new }

    describe '.apply' do
      it 'exists' do
        Sunspot.should respond_to(:apply)
      end

      it 'registers the data accessor' do
        Sunspot.apply(model)

        ::Sunspot::Adapters::DataAccessor.send(:data_accessors).should include(:"Sequel::Model" => Sunspot::DataAccessor)
      end
    end

    describe '.configure' do
      it 'exists' do
        Sunspot.should respond_to(:configure)
      end
    end
  end
end

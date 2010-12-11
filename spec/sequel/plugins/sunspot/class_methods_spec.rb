require 'spec_helper'

module Sequel::Plugins::Sunspot
  describe ClassMethods do
    let(:widget) { Class.new(Widget) }

    describe '#searchable' do
      it 'sets up indexing on a model' do
        ::Sunspot.should_receive(:setup).with(widget)

        widget.searchable
      end
    end
  end
end

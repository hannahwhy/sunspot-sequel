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

    describe '#search' do
      it 'searches for instances of that model' do
        invoked = nil
        block = lambda { |v| invoked = v }

        ::Sunspot.should_receive(:search).and_yield(true)

        widget.search(&block)

        invoked.should be_true
      end
    end
  end
end

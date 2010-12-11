require 'spec_helper'

module Sequel::Plugins::Sunspot
  describe InstanceMethods do
    let(:widget) { Widget.new }

    describe '#index' do
      it 'indexes the model' do
        ::Sunspot.should_receive(:index).with(widget)

        widget.index
      end
    end

    describe '#index!' do
      it 'indexes and commits the model' do
        ::Sunspot.should_receive(:index!).with(widget)

        widget.index!
      end
    end
  end
end

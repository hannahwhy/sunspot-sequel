require 'spec_helper'

module Sequel::Plugins::Sunspot
  describe InstanceAdapter do
    let(:model) { Widget.new }
    let(:adapter) { InstanceAdapter.new(model) }

    before do
      model.id = 1
    end

    describe '#id' do
      it "returns the model's primary key" do
        adapter.id.should == model.pk
      end
    end
  end
end

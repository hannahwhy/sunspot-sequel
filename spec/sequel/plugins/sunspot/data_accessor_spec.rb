require 'spec_helper'

module Sequel::Plugins::Sunspot
  describe DataAccessor do
    let(:model) { Widget.new }
    let(:accessor) { DataAccessor.new(model) }

    before do
      model.id = 1
    end

    describe '#id' do
      it "returns the model's primary key" do
        accessor.id.should == model.pk
      end
    end
  end
end

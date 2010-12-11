require 'spec_helper'

module Sequel::Plugins::Sunspot
  describe DataAccessor do
    let(:w1) { Widget.new }
    let(:w2) { Widget.new }
    let(:accessor) { DataAccessor.new(Widget) }

    before do
      [w1, w2].each { |w| w.save }
    end

    describe '#load' do
      it 'loads one record by its ID' do
        accessor.load(w1.id).should == w1
      end
    end

    describe '#load_all' do
      it 'loads many records by their IDs' do
        accessor.load_all([w1.id, w2.id]).should include(w1, w2)
      end

      it 'can be filtered further' do
        accessor.load_all([w1.id, w2.id]).where(:id => w1.id).all.should == [w1]
      end
    end
  end
end

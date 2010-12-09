require 'spec_helper'

module Sequel::Plugins
  describe Sunspot do
    describe '.apply' do
      it 'exists' do
        Sunspot.should respond_to(:apply)
      end
    end

    describe '.configure' do
      it 'exists' do
        Sunspot.should respond_to(:configure)
      end
    end
  end
end

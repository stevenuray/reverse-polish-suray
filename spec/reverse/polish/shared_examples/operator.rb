require 'spec_helper'
require 'reverse/polish/suray/operator/operator'

shared_examples_for 'Operator' do
  describe 'mandatory methods' do
    describe '#operate' do
      it 'should not raise exception' do
        expect { described_class.new.operate(1, 2) }.to_not raise_error
      end
    end

    describe '#symbol' do
      it 'should not raise exception' do
        expect { described_class.new.symbol }.to_not raise_error
      end
    end

    describe 'inclusion in Operator.operators' do
      it 'is in Operator.operators' do
        expect(Operator.operators).to include described_class
      end
    end
  end
end

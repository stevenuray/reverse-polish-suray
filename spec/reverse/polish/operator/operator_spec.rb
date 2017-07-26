require 'spec_helper'
require 'reverse/polish/suray/operator/operator'

describe Operator do
  describe '#class methods' do
    describe '#operators' do
      it 'should include at least one operator' do
        expect(Operator.operators.length).to be > 0
      end
    end

    describe '#operator_symbols' do
      it 'should include the addition symbol' do
        expect(Operator.operator_symbols).to include '+'
      end
    end

    describe '#symbols_to_operators' do
      it 'should map + symbol to Addition class' do
        expect(Operator.symbols_to_operators['+']).to eq Operator::Addition
      end
    end
  end
end

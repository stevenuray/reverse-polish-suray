require 'spec_helper'
require 'reverse/polish/suray/input_validator'
require 'reverse/polish/suray/operator_exception'

describe InputValidator do
  let(:input) { '1 2 +' }
  let(:validator) { InputValidator.new(input) }

  describe '#validate' do
    context 'with valid input' do
      let(:response) { validator.validate }

      it 'should return successful input validation' do
        expect(response.input_valid?).to eq true
      end
    end

    context 'with invalid input' do
      let(:response) { validator.validate }

      context 'invalid number input' do
        context 'with invalid number character' do
          let(:input) { '? 2 +' }

          it 'returns invalid number' do
            expect { response }.to raise_exception(ArgumentError)
          end
        end

        context 'with missing number character' do
          let(:input) { ' +' }

          it 'returns invalid number' do
            expect { response }.to raise_exception(ArgumentError)
          end
        end
      end

      context 'with invalid operator input' do
        context 'with invalid operator character' do
          let(:input) { '1 2 c' }

          it 'throws OperatorException' do
            expect { response }.to raise_exception(OperatorException, "c is not a valid operator.")
          end
        end

        context 'with missing operator' do
          let(:input) { '1 2 ' }

          it 'throws OperatorException' do
            expect { response }.to raise_exception(OperatorException)
          end
        end
      end

      context 'with invalid input string' do
        context 'with no spacing' do
          let(:input) { '12+' }

          it 'should return something' do
            expect { response }.to raise_exception(OperatorException)
          end
        end

        context 'with numbers after operator' do
          let(:input) { '1 2 + 1' }
          it 'should return something' do
            expect { response }.to raise_exception(OperatorException)
          end
        end
      end
    end
  end
end

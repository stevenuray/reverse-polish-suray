require 'spec_helper'
require 'reverse/polish/suray/validation/input_validator'
require 'reverse/polish/suray/validation/operator_error'
require 'reverse/polish/suray/validation/number_error'

describe InputValidator do
  let(:input) { '1 2 +' }
  let(:validator) { InputValidator.new }

  describe '#validate' do
    context 'with valid input' do
      let(:validation) { validator.validate(input) }

      it 'should return successful input validation' do
        expect(validation.response).to eq :valid_input
      end
    end

    context 'with invalid input' do
      let(:validation) { validator.validate(input) }

      context 'invalid number input' do
        context 'with invalid number character' do
          let(:input) { '? 2 +' }

          it 'returns invalid number' do
            expect(validation.response.class).to eq(NumberError)
          end
        end

        context 'with missing number character' do
          let(:input) { ' +' }

          it 'returns invalid number' do
            expect(validation.response.class).to eq(ArgumentError)
          end
        end
      end

      context 'with invalid operator input' do
        context 'with invalid operator character' do
          let(:input) { '1 2 c' }

          it 'throws OperatorException' do
            expect(validation.response.class).to eq(OperatorError)
          end
        end

        context 'with missing operator' do
          let(:input) { '1 2 ' }

          it 'throws OperatorException' do
            expect(validation.response.class).to eq(OperatorError)
          end
        end
      end

      context 'with invalid input string' do
        context 'with no spacing' do
          let(:input) { '12+' }

          it 'should return something' do
            expect(validation.response.class).to eq(OperatorError)
          end
        end

        context 'with numbers after operator' do
          let(:input) { '1 2 + 1' }
          it 'should return something' do
            expect(validation.response.class).to eq(OperatorError)
          end
        end
      end
    end
  end
end

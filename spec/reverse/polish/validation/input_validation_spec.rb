require 'spec_helper'
require 'reverse/polish/suray/validation/input_validation'

describe InputValidation do
  describe '#input_valid?' do
    context 'with valid response' do
      let(:input_validation) { InputValidation.new("Test Input", :success) }

      it 'returns true' do
          expect(input_validation.input_valid?).to be_truthy
      end
    end

    context 'with invalid response' do
      let(:input_validation) { InputValidation.new("Test Input", :invalid_operator) }

      it 'returns false if response is not successful' do
        expect(input_validation.input_valid?).to be_falsey
      end
    end
  end
end

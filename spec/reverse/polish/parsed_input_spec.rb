require 'spec_helper'
require 'reverse/polish/suray/ParsedInput'

describe ParsedInput do
  let(:operator) { '+' }
  let(:parsed_input) { ParsedInput.new([2,1], operator)}

  describe '#calculate_answer' do
    it 'should return the correct answer' do
      expect(parsed_input.calculate_answer).to eq 3
    end
  end
end

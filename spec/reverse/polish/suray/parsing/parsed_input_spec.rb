require 'spec_helper'
require 'reverse/polish/suray/parsing/parsed_input'

describe ParsedInput do
  let(:operator) { '+' }
  let(:parsed_input) { ParsedInput.new([2, 1], operator) }

  describe '#calculate_answer' do
    it 'should return the correct answer' do
      expect(parsed_input.calculate_answer).to eq 3
    end
  end

  describe '#complete_command?' do
    context 'with complete_command' do
      it 'should return true' do
        expect(parsed_input.complete_command?).to be_truthy
      end
    end

    context 'with incomplete command' do
      let(:parsed_input) { ParsedInput.new([1], operator) }

      it 'should return false' do
        expect(parsed_input.complete_command?).to be_falsey
      end
    end
  end
end

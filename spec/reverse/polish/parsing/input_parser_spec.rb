require 'spec_helper'
require 'reverse/polish/suray/parsing/input_parser'
require 'bigdecimal'

describe InputParser do
  let(:input_string) { '1 2 +' }
  let(:parser) { InputParser.new(input_string) }
  let(:parsed_input) { parser.input }

  it 'should convert input string numbers correctly' do
    expect(parsed_input.numbers).to eq [BigDecimal.new(1), BigDecimal.new(2)]
  end

  it 'should convert input operator correctly' do
    expect(parsed_input.operator).to eq '+'
  end
end

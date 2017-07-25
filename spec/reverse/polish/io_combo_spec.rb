require 'spec_helper'
require 'reverse/polish/suray/io_combo'

describe IOCombo do
  let(:input) { double("input") }
  let(:output) { double("output") }
  let(:io_combo) { IOCombo.new(input, output) }

  describe '#process_next_input' do
    context 'with valid input' do
      before(:each) do
        allow(input).to receive(:read_next_line).and_return("1 2 +")
      end

      it 'should call @output.output_result with the correct answer' do
        expect(output).to receive(:output_result).with(BigDecimal.new(3))
        io_combo.process_next_input
      end
    end

    context 'with invalid input' do
      before(:each) do
        allow(input).to receive(:read_next_line).and_return("1 2 frog")
      end

      it 'should call output_error on output with invalid input' do
        expect(output).to receive(:output_error)
        io_combo.process_next_input
      end
    end
  end

  describe '#output_info' do
    let(:test_info) { 'Test Info!' }

    it 'passes info to @output' do
      expect(output).to receive(:output_info).with(test_info)
      io_combo.output_info(test_info)
    end
  end
end

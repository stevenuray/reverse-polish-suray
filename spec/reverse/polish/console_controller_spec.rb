require 'spec_helper'
require 'reverse/polish/suray/console_controller'
require 'bigdecimal'

describe ConsoleController do
  let(:input) { double("input") }
  let(:output) { double("output") }
  let(:controller) { ConsoleController.new(input, output) }

  describe '#process_next_input' do
    let(:next_input) { '1 2 +' }

    before(:each) do
      allow(input).to receive(:read_next_input).and_return(next_input)
    end

    context 'with input that references previous answer' do
      let(:inputs) { ['4 2 +', '2 +'] }

      before(:each) do
        allow(input).to receive(:read_next_input).and_return(inputs[0])
      end

      it 'should use the last answer as part of the input' do
        expect(output).to receive(:output_result).with(BigDecimal.new(6))
        controller.process_next_input
        allow(input).to receive(:read_next_input).and_return(inputs[1])
        expect(output).to receive(:output_result).with(BigDecimal.new(8))
        controller.process_next_input
      end
    end

    context 'with input that cannot reference previous answer' do
      let(:next_input) { '2 +' }

      it 'should output an error message' do
        expect(output).to receive(:output_error)
        controller.process_next_input
      end
    end

    context 'with partial input' do
      context 'with invalid input' do
        let(:next_input) { 'Seagull' }

        it 'should return error message' do
          expect(output).to receive(:output_error)
          controller.process_next_input
        end
      end
    end

    context 'with complete input' do
      context 'with valid input' do
        it 'should call @output.output_result with the correct answer' do
          expect(output).to receive(:output_result).with(BigDecimal.new(3))
          controller.process_next_input
        end
      end

      context 'with invalid input' do
        let(:next_input) { '1 2 frog' }

        it 'should call output_error on output with invalid input' do
          expect(output).to receive(:output_error)
          controller.process_next_input
        end
      end
    end
  end
end

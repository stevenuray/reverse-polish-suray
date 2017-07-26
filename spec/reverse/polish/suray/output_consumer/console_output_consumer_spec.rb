require 'spec_helper'
require 'reverse/polish/suray/output_consumer/console_output_consumer'
require 'reverse/polish/suray/rpn_config'
require 'bigdecimal'

describe ConsoleOutputConsumer do
  let(:output) { ConsoleOutputConsumer.new }

  describe '#output_result' do
    let(:test_result) { BigDecimal.new(3, 0) }

    #TODO shared examples here?
    context 'with integer result' do
      it 'should print result to STDOUT' do
        expect(STDOUT).to receive(:puts).with(test_result.to_i)
        output.output_result(test_result)
      end
    end

    context 'with decimal result' do
      let(:test_result) { BigDecimal.new(3.14, 3) }

      it 'should print result to STDOUT' do
        expect(STDOUT).to receive(:puts).with("3.14")
        output.output_result(test_result)
      end
    end

    context 'with negative decimal result' do
      let(:test_result) { BigDecimal.new(-3.14, 3) }

      it 'should print result to STDOUT' do
        expect(STDOUT).to receive(:puts).with("-3.14")
        output.output_result(test_result)
      end
    end
  end

  describe '#output_error' do
    let(:test_error) { 'Invalid operator.' }

    it 'should print result to STDOUT' do
      expect(STDOUT).to receive(:puts).with(test_error)
      output.output_error(test_error)
    end
  end

  describe '#output_info' do
    let(:test_info) { 'Test Info!' }

    it 'should print result to STDOUT' do
      expect(STDOUT).to receive(:puts).with(test_info)
      output.output_info(test_info)
    end
  end
end

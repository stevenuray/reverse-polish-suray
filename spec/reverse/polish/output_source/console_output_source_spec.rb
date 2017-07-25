require 'spec_helper'
require 'reverse/polish/suray/output_source/console_output_source'

describe ConsoleOutputSource do
  let(:output) { ConsoleOutputSource.new }

  describe '#output_result' do
    let(:test_result) { '3.000000' }

    it 'should print result to STDOUT' do
      expect(STDOUT).to receive(:puts).with(test_result)
      output.output_result(test_result)
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

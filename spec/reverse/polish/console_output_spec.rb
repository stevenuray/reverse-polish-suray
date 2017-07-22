require 'spec_helper'
require 'reverse/polish/suray/console_output_source'

describe ConsoleOutputSource do
  let(:output) { ConsoleOutputSource.new }

  describe '#output_result' do
    let(:test_result) { '3' }

    it 'should print result to STDOUT' do
      expect(STDOUT).to receive(:puts).with(test_result)
      output.output_result(test_result)
    end
  end

  describe '#output_error' do
    let(:test_error) { 'Invalid operator.' }

    it 'should do something' do
      expect(STDOUT).to receive(:puts).with(test_error)
      output.output_error(test_error)
    end
  end
end

require 'spec_helper'
require 'reverse/polish/suray/console_input_source'

describe ConsoleInputSource do
  let(:input) { ConsoleInputSource.new }

  describe '#read_next_line' do
    let(:test_line) { '1 2 +' }

    before(:each) do
      allow(STDIN).to receive(:gets) { test_line }
    end

    it 'should do something' do
      expect(input.read_next_line).to eq test_line
    end
  end
end

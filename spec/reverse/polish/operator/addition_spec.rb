require 'spec_helper'
require 'reverse/polish/suray/operator/addition'
require './spec/reverse/polish/shared_examples/operator'

describe Operator::Addition do
  it_behaves_like 'Operator'
end

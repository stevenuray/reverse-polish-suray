require 'spec_helper'
require 'reverse/polish/suray/operator/multiplication'
require './spec/reverse/polish/shared_examples/operator'

describe Operator::Multiplication do
  it_behaves_like 'Operator'
end

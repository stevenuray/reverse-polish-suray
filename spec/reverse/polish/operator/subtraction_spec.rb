require 'spec_helper'
require 'reverse/polish/suray/operator/subtraction'
require './spec/reverse/polish/shared_examples/operator'

describe Operator::Subtraction do
  it_behaves_like 'Operator'
end

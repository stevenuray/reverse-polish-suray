require 'spec_helper'
require 'reverse/polish/suray/operator/division'
require './spec/reverse/polish/shared_examples/operator'

describe Operator::Division do
  it_behaves_like 'Operator'
end

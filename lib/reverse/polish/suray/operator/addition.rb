require 'reverse/polish/suray/operator/operator'

class Operator::Addition
  include Operator

  def operate(first, second)
    first + second
  end

  def symbol
    '+'
  end
end

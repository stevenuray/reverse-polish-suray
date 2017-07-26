require 'reverse/polish/suray/operator/operator'

class ParsedInput
  attr_reader :numbers, :operator

  def calculate_answer
    operator.new.operate(@numbers[0], @numbers[1])
  end

  def complete_command?
    if numbers.length == 2
      true
    else
      false
    end
  end

  private

  def initialize(numbers, operator)
    @numbers = numbers
    @operator = operator
  end
end

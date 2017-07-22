require 'reverse/polish/suray/ParsedInput'

class InputParser

  def input
    @input ||= convert_input_string
  end

  def convert_input_string
    numbers = @input_string.split(' ')
    operator = numbers.pop
    numbers = numbers.map { |n| BigDecimal.new(n) }
    ParsedInput.new(numbers, operator)
  end

  private

  def initialize(input_string)
    @input_string = input_string
  end
end

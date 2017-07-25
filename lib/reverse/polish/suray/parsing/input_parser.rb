require 'reverse/polish/suray/parsing/parsed_input'

class InputParser
  #TODO consider moving this to a single point of configuration and referencing
  SEPARATOR = ' '

  def input
    @input ||= convert_input_string
  end

  def convert_input_string
    numbers = @input_string.split(SEPARATOR)
    operator = numbers.pop
    numbers = numbers.map { |n| BigDecimal.new(n) }
    ParsedInput.new(numbers, operator)
  end

  private

  def initialize(input_string)
    @input_string = input_string
  end
end

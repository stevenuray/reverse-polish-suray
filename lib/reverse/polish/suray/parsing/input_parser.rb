require 'reverse/polish/suray/parsing/parsed_input'
require 'reverse/polish/suray/rpn_config'

class InputParser
  def input
    @input ||= convert_input_string
  end

  def convert_input_string
    numbers = @input_string.split(RPNConfig.input_separator)
    operator = numbers.pop
    numbers = numbers.map { |n| BigDecimal.new(n) }
    ParsedInput.new(numbers, operator)
  end

  private

  def initialize(input_string)
    @input_string = input_string
  end
end

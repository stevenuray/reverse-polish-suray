require 'reverse/polish/suray/validation/operator_exception'
require 'reverse/polish/suray/validation/input_validation'
require 'reverse/polish/suray/rpn_config'
require 'bigdecimal'

class InputValidator
  def validate
    validate_operator
    validate_numbers
    return InputValidation.new(@input, :success)
  end

  def validate_operator
    operator = @input.split(RPNConfig.input_separator).last
    unless RPNConfig.valid_operators.include? operator
      raise OperatorException.new("#{operator} is not a valid operator.")
    end
  end

  def validate_numbers
    numbers_strings = @input.split(RPNConfig.input_separator)
    numbers_strings.pop

    #TODO reconsider decision to raise ArgumentError here instead of a custom exception
    if numbers_strings.count == 0
      raise ArgumentError.new("No numbers provided.")
    end

    #TODO deal with exceptions that will be thrown if words are input to the program
    numbers_strings.each { |n| Float(n) }
  end

  private

  def initialize(input)
    @input = input
  end
end

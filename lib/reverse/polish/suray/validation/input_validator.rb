require 'reverse/polish/suray/validation/operator_exception'
require 'bigdecimal'
require 'pry'
require 'reverse/polish/suray/validation/input_validation'

class InputValidator
  def validate
    validate_operator
    validate_numbers
    return InputValidation.new(@input, :success)
  end

  def validate_operator
    #TODO consider automatically generating this from the location in this application that specifies all valid operators
    valid_operators = ['+', '-', '*', '/']
    #TODO pull separator from a single definition and reference
    operator = @input.split(' ').last
    unless valid_operators.include? operator
      raise OperatorException.new("#{operator} is not a valid operator.")
    end
  end

  def validate_numbers
    #TODO pull separator from a single definition and reference
    numbers_strings = @input.split(' ')
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

require 'reverse/polish/suray/validation/operator_error'
require 'reverse/polish/suray/validation/input_validation'
require 'reverse/polish/suray/rpn_config'
require 'reverse/polish/suray/validation/number_error'
require 'bigdecimal'

class InputValidator
  def validate(input)
    begin
      validate_operator(input)
      validate_numbers(input)
      response = :valid_input
    rescue StandardError => e
      response = e
    end

    return InputValidation.new(input, response)
  end

  def validate_operator(input)
    operator = input.split(RPNConfig.input_separator).last
    unless RPNConfig.valid_operators.include? operator
      raise OperatorError.new("#{operator} is not a valid operator.")
    end
  end

  def validate_numbers(input)
    numbers_strings = input.split(RPNConfig.input_separator)
    numbers_strings.pop

    if numbers_strings.count == 0
      raise ArgumentError.new("No numbers provided.")
    end

    begin
      numbers_strings.map! { |n| Float(n) }
    rescue StandardError
      raise NumberError.new("Invalid number!")
    end
  end
end

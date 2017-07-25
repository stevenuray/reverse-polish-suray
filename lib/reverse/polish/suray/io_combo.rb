require 'reverse/polish/suray/input_parser'
require 'reverse/polish/suray/input_validator'

class IOCombo

  #TODO consider enforcing an input format like UTF-8 etc
  def process_next_input
    next_line = @input.read_next_line

    #TODO consider putting this in another function
    begin
      InputValidator.new(next_line).validate
    rescue StandardError => e
      @output.output_error(e)
      return
    end

    parsed_input = InputParser.new(next_line).input
    @output.output_result(calculate_answer(parsed_input))
  end

  def calculate_answer(parsed_input)
    #TODO reconsider use of send here
    #TODO abstract operators to classes that implement an interface?
    parsed_input.numbers[0].send(parsed_input.operator.to_sym, parsed_input.numbers[1])
  end

  #TODO consider use of delegate here
  def output_info(info)
    @output.output_info(info)
  end

  private

  #TODO consider passing in validator, parser for more dependency inversion here
  def initialize(input, output)
    @input = input
    @output = output
  end
end

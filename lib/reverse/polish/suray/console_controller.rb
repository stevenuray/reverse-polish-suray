require "reverse/polish/suray/console_input_source"
require "reverse/polish/suray/console_output_source"
require "reverse/polish/suray/explanation_presenter"
require "reverse/polish/suray/input_parser"
require "reverse/polish/suray/input_validator"

#TODO consider refactoring this to be less console specific and more generic
class ConsoleController
  def execute
    @output.output_greeting
    @output.output_initialization
    @output.output_examples

    #TODO reconsider this loop
    while true do
      if process_next_input == :exit_command
        break
      end
    end

    @output.output_goodbye
  end

  #TODO consider enforcing an input format like UTF-8 etc
  def process_next_input
    next_line = @input.read_next_line

    if next_line == :exit_command
      return :exit_command
    end

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

  def initialize(input, output)
    @input = input
    @output = output
  end
end

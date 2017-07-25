require "reverse/polish/suray/console_input_source"
require "reverse/polish/suray/console_output_source"
require "reverse/polish/suray/explanation_presenter"
require "reverse/polish/suray/input_parser"
require "reverse/polish/suray/input_validator"

#TODO consider refactoring this to be less console specific and more generic
class ConsoleController
  def execute
    initial_messages

    #TODO reconsider this loop
    while true do
      if process_next_input == :exit_command
        break
      end
    end

    @output.output_goodbye
  end

  #TODO consider enforcing an input format like UTF-8 etc
  #TODO general cleanup here
  def process_next_input
    next_input = @input.read_next_input

    if next_input == :exit_command
      return :exit_command
    end

    #TODO consider putting this in another function
    begin
      InputValidator.new(next_input).validate
    rescue StandardError => e
      @output.output_error(e)
      return
    end

    if input_complete?(next_input)
      process_new_answer(InputParser.new(next_input).input)
    else
      if @last_answer
        input = InputParser.new(next_input).input
        process_new_answer(ParsedInput.new(input.numbers.push(@last_answer), input.operator))
      else
        @output.output_error("#{next_input} is not a complete calculation!")
      end
    end
  end

  private

  def initialize(input, output)
    @input = input
    @output = output
  end

  def initial_messages
    @output.output_greeting
    @output.output_initialization
    @output.output_examples
  end

  #TODO consider replacing this function with a builder
  def input_complete?(next_input)
    InputParser.new(next_input).input.complete_command?
  end

  #TODO generally rethink this and it's usages
  def process_new_answer(parsed_input)
    @last_answer = parsed_input.calculate_answer
    @output.output_result(@last_answer)
  end
end

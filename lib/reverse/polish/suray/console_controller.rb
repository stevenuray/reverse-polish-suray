require "reverse/polish/suray/console_input_source"
require "reverse/polish/suray/console_output_source"
require "reverse/polish/suray/explanation_presenter"
require "reverse/polish/suray/input_parser"
require "reverse/polish/suray/input_validator"

#TODO consider refactoring this to be less console specific and more generic
class ConsoleController
  def execute
    display_greeting
    display_initialization
    display_examples

    #TODO reconsider this loop
    while true do
      if process_next_input == :exit_command
        break
      end
    end

    @output.output_info(ExplanationPresenter.goodbye)
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

  #TODO move this into a helper or presenter?
  def build_slashes(string)
    slashes = ''

    string.length.times do
      slashes << '-'
    end

    slashes
  end

  def find_longest_string(strings)
    longest_string = ''
    strings.each { |string| longest_string = string if string.length > longest_string.length }
    longest_string
  end

  #TODO DRY this up
  def display_greeting
    slashes = build_slashes(ExplanationPresenter.greeting)

    greeting_lines = [slashes, ExplanationPresenter.greeting, slashes, '']

    greeting_lines.each { |line| @output.output_info(line) }
  end

  #TODO break this into smaller functions
  def display_initialization
    msgs = ExplanationPresenter.fake_initialization_messages
    rand_range = 0..msgs.length-1
    random_init_messages = [' -'+msgs[Random.new.rand(rand_range)], ' -'+msgs[Random.new.rand(rand_range)]]
    init_lines = ['***INITIALIZING***', random_init_messages].flatten
    slashes = build_slashes(find_longest_string(init_lines))
    init_lines.push(slashes)
    init_lines.unshift(slashes)
    init_lines.push('')

    init_lines.each { |line| @output.output_info(line) }
  end

  def display_examples
    example_lines = ['Examples:', ExplanationPresenter.examples, ''].flatten
    example_lines.each { |line| @output.output_info(line) }
  end
end

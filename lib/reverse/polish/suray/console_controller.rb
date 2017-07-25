require "reverse/polish/suray/console_input_source"
require "reverse/polish/suray/console_output_source"
require "reverse/polish/suray/io_combo"
require "reverse/polish/suray/explanation_presenter"

#TODO consider refactoring this to be less console specific and more generic
class ConsoleController

  def execute
    display_greeting
    display_initialization
    display_examples

    while true do
      @io_combo.process_next_input
    end
  end

  private

  def initialize
    @io_combo = IOCombo.new(ConsoleInputSource.new, ConsoleOutputSource.new)
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

    greeting_lines.each { |line| @io_combo.output_info(line) }
  end

  def display_initialization
    msgs = ExplanationPresenter.fake_initialization_messages
    rand_range = 0..msgs.length-1
    random_init_messages = [msgs[Random.new.rand(rand_range)], msgs[Random.new.rand(rand_range)]]
    init_lines = ['Initializing...', random_init_messages].flatten
    slashes = build_slashes(find_longest_string(init_lines))
    init_lines.push(slashes)
    init_lines.unshift(slashes)
    init_lines.push('')

    init_lines.each { |line| @io_combo.output_info(line) }
  end

  def display_examples
    example_lines = ['Examples:', ExplanationPresenter.examples, ''].flatten
    example_lines.each { |line| @io_combo.output_info(line) }
  end
end

require 'reverse/polish/suray/output_source/output_source'
require 'reverse/polish/suray/rpn_config'

class ConsoleOutputSource
  include OutputSource

  ##
  # It is tempting to move this var to RPNConfig, but if users set it to a number larger
  # than the number of fake init messages, the program will infintely loop due to an until!
  FAKE_INIT_MESSAGES = 3

  def output_result(result)
    precision = RPNConfig.decimal_precision

    #TODO ternary here?
    if result.to_i == result
      STDOUT.puts(result.to_i)
    else
      rounded_result = result.round(precision)
      #TODO clarify this
      STDOUT.puts("%.#{ precision }g" % ("%.#{ precision }f" % rounded_result))
    end
  end

  def output_error(error)
    STDOUT.puts(error)
  end

  def output_info(info)
    STDOUT.puts(info)
  end

  def output_lines(lines)
    lines.each { |line| output_info(line) }
  end

  def output_greeting
    slashes = build_slashes(ExplanationPresenter.greeting)
    output_lines([slashes, ExplanationPresenter.greeting, slashes, ''])
  end

  def output_initialization
    init_lines = ['***INITIALIZING***', build_fake_init_messages].flatten
    slashes = build_slashes(find_longest_string(init_lines))
    init_lines.push(slashes)
    init_lines.unshift(slashes)
    init_lines.push('')
    output_lines(init_lines)
  end

  def output_examples
    output_lines(['Examples:', ExplanationPresenter.examples, ''].flatten)
  end

  def output_goodbye
    slashes = build_slashes(ExplanationPresenter.goodbye)
    output_lines([slashes, ExplanationPresenter.goodbye, slashes])
  end

  private

  def build_slashes(string)
    slashes = ''
    string.length.times { slashes << '-' }
    slashes
  end

  def build_fake_init_messages
    ExplanationPresenter.random_unique_fake_init_messages(FAKE_INIT_MESSAGES).map { |m| ' -' + m }
  end

  def find_longest_string(strings)
    longest_string = ''
    strings.each { |string| longest_string = string if string.length > longest_string.length }
    longest_string
  end
end

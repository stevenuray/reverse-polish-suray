require 'reverse/polish/suray/input_source/input_source'
require 'reverse/polish/suray/rpn_config'

class ConsoleInputSource
  include InputSource

  def read_next_input
    next_line = ''

    #Catching Ctrl + D end of input indicator with this begin/rescue block
    begin
      next_line = STDIN.gets.chomp
    rescue NoMethodError => e
      next_line = :exit_command
    end

    if RPNConfig.exit_commands.include? next_line
      :exit_command
    else
      next_line
    end
  end
end

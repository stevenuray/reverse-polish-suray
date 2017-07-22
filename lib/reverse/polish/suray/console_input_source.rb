require 'reverse/polish/suray/input_source'

class ConsoleInputSource
  def read_next_line
    STDIN.gets.chomp
  end
end

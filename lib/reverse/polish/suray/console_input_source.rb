class ConsoleInputSource
  EXIT_COMMANDS = [ 'q' ]

  def read_next_line
    next_line = ''

    #Catching Ctrl + D end of input indicator with this begin/rescue block
    begin
      next_line = STDIN.gets.chomp
    rescue NoMethodError => e
      next_line = :exit_command
    end

    if EXIT_COMMANDS.include? next_line
      :exit_command
    else
      next_line
    end
  end
end

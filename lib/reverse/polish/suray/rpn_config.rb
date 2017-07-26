#TODO implement actual config management solution or hierarchy of sources
class RPNConfig
  ENV_ARRAY_SEPARATOR = ','

  #TODO ternary operators?
  class << self
    def input_separator
      ENV['RPN_INPUT_SEPARATOR'] || ' '
    end

    def decimal_precision
      if ENV['RPN_DECIMAL_PRECISION']
        ENV['RPN_DECIMAL_PRECISION'].to_i
      else
        10
      end
    end

    def exit_commands
      if ENV['RPN_EXIT_COMMANDS']
        ENV['RPN_EXIT_COMMANDS'].split(ENV_ARRAY_SEPARATOR)
      else
        ['q', 'exit']
      end
    end
  end
end

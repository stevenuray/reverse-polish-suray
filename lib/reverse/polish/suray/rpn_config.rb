#TODO implement actual config management solution or hierarchy of sources
class RPNConfig
  ENV_ARRAY_SEPARATOR = ','

  class << self
    def input_separator
      ENV['RPN_INPUT_SEPARATOR'] || ' '
    end

    def valid_operators
      if ENV['RPN_VALID_OPERATORS']
        ENV['RPN_VALID_OPERATORS'].split(ENV_ARRAY_SEPARATOR)
      else
        ['+', '-', '*', '/']
      end
    end

    def decimal_precision
      ENV['RPN_DECIMAL_PRECISION'] || 10
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

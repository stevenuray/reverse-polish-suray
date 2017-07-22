class ConsoleOutputSource
  def output_result(result)
    STDOUT.puts(result)
  end

  def output_error(error)
    STDOUT.puts(error)
  end
end

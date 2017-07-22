class ConsoleOutputSource
  def output_result(result)
    STDOUT.puts("%f" % result)
  end

  def output_error(error)
    STDOUT.puts(error)
  end
end

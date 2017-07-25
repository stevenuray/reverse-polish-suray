InputValidation = Struct.new(:input, :response) do
  def input_valid?
    response == :success
  end
end

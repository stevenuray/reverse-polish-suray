class ParsedInput
  attr_reader :numbers, :operator

  def calculate_answer
    #TODO reconsider use of send here
    #TODO abstract operators to classes that implement an interface?
    @numbers[0].send(@operator.to_sym, @numbers[1])
  end

  private

  def initialize(numbers, operator)
    @numbers = numbers
    @operator = operator
  end
end

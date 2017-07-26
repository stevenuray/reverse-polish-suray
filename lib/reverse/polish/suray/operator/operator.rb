module Operator
  class << self
    def operators
      load_operator_files
      ObjectSpace.each_object(Class).select { |c| c.included_modules.include? Operator }
    end

    def operator_symbols
      operators.collect { |operator| operator.new.symbol }
    end

    def symbols_to_operators
      hash = { }
      operators.each { |o| hash[o.new.symbol]=o }
      hash
    end

    private

    #TODO figure out way to do this only one time
    def load_operator_files
      #TODO project relative path here
      Dir['../lib/reverse/polish/suray/operator/*.rb'].each { |file| require file }
    end
  end

  def operate(first, second)
    raise NotImplementedError
  end

  def symbol
    raise NotImplementedError
  end
end

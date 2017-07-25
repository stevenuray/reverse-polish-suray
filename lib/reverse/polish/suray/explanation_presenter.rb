class ExplanationPresenter
  #TODO consider replacing with i18n or similar solution
  class << self
    def greeting
      'Welcome to Steven Uray\'s Reverse Polish Calculator!'
    end

    def explanation
      ''
    end

    def examples
      ['1 2 +', '3.14 2 -', '-3 2 *', '4 2 /']
    end
  end

end

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

    def goodbye
      'Thanks for using Steven Uray\'s Reverse Polish Calculator!'
    end

    #TODO consider removing
    def fake_initialization_messages
      ['Building additional pylons...',
       'Performing rain dance...',
       'Sending bitcoins to ransomsware address...',
       'Complying with secret NSA requirements...',
       'Shoehorning machine learning into this project somehow...']
    end
  end

end

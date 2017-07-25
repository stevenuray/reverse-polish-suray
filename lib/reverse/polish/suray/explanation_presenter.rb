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
       'Complying with secret NSA mandates...',
       'Shoehorning machine learning into this project somehow...',
       'Watching Elon Musk videos, questioning life choices...',
       'Hiding from Lumbergh...',
       'Filling out TPS report ASAP...',
       'Over-promising, under-delivering...',
       'Creating ICO on Ethereum, receiving millions of dollars...']
    end

    def random_fake_initialization_message
      msgs = ExplanationPresenter.fake_initialization_messages
      rand_range = 0..msgs.length-1
      msgs[Random.new.rand(rand_range)]
    end

    #TODO fill out and use
    def random_unique_fake_init_messages
      nil
    end

    def format
      '[number] [number] [operator]'
    end
  end

end

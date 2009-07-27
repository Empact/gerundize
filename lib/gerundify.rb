module Gerundify
  GERUND_EXCEPTIONS = {
    'blue' => 'blueing',

    'brag' => 'bragging',

    'submit' => 'submitting',
    'bet' => 'betting',
    'blot' => 'blotting',
    'chat' => 'chatting',
    'cut' => 'cutting',
    'dot' => 'dotting',
    'fit' => 'fitting',
    'flat' => 'flatting',
    'flit' => 'flitting',
    'forget' => 'forgetting',
    'get' => 'getting',
    'jot', 'knit', 'knot'
  }

  def gerundify
    GERUND_EXCEPTIONS[self] ||
    case self
    when /ing$/
      self
    when /(.*)e$/
      "#{$1}ing"
    else
      "#{self}ing"
    end
  end
end

class String
  include Gerundify
end
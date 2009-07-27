module Gerundify
  GERUND_EXCEPTIONS = {
    'blue' => 'blueing',

    'brag' => 'bragging',
  }

  GERUND_DOUBLE_TS = %w(submit bet blot chat cut dot fit flat flit forget get jot
    knit knot shut sit slit slot spat spit unset wet wit)

  def gerundify
    GERUND_EXCEPTIONS[self] ||
    if self =~ /ing$/
      self
    elsif self =~ /(.*)ie$/
      "#{$1}ying"
    elsif self =~ /(.*)e$/
      "#{$1}ing"
    elsif GERUND_DOUBLE_TS.include?(self.downcase)
      "#{self}ting"
    else
      "#{self}ing"
    end
  end
end

class String
  include Gerundify
end
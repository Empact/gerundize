module Gerundize
  GERUND_EXCEPTIONS = {
    'blue' => 'blueing'
  }

  GERUND_DOUBLES = %w(
    brag plug

    zip

    submit bet blot chat cut dot fit flat flit forget get jot
    knit knot shut sit slit slot spat spit unset wet wit plot

    abhor bar concur demur jar scar spur star stir transfer unjar
  )

  def gerundize
    GERUND_EXCEPTIONS[self] ||
    if self =~ /ing$/
      self
    elsif self =~ /(.*)ie$/
      "#{$1}ying"
    elsif self =~ /(.*)e$/
      "#{$1}ing"
    elsif GERUND_DOUBLES.include?(self.downcase)
      "#{self + self[-1,1]}ing"
    else
      "#{self}ing"
    end
  end

  alias_method :to_gerund, :gerundize
end

class String
  include Gerundize
end
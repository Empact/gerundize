require 'set'

module Gerundize
  GERUND_LEAVE_ALONES = Set.new %w(
    fricassee hoe pee pie dye see free emcee cue sightsee
  )

  GERUND_DOUBLES = Set.new %w(
    rub snub

    bid shed outbid

    snug bag hog

    brag plug hag smug snag snap snip

    yodel fuel expel total dispel

    hum clam ham shim cram

    gin dun sin shun shin

    up zip clap mop sap shop ship yap crap recap

    blur slur abhor bar concur demur jar scar spur star stir transfer unjar recur

    focus

    submit bet blot chat cut dot fit flat flit forget get jot cat fret
    knit knot shut sit slit slot spat spit unset wet wit plot nut shit
    emit snot facet sublet tat hit
  )

  def gerundize
    if GERUND_LEAVE_ALONES.include?(self.downcase)
      "#{self}ing"
    elsif self =~ /ing$/
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

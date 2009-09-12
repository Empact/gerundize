require 'set'

module Gerundize
  GERUND_DIRECT = Set.new %w(
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

    ricochet reformat flimflam backstop bullshit resubmit retrofit eavesdrop reprogram backpedal horsewhip nightclub deprogram jitterbug disembowel quarrel program refer admit refit equip excel

    peg pen win pin pit ban beg bin rib tug rip rob rot bud bum tip can cap tin run nod nip net nag tap tan man lop cup log dig lap lag jab pad hug fan gas sop sog sod sob spin flog flag grin spar slum slug spot stab stem slog slip stop sled drum drub drop slap drag stun swap swim skip skin skim club thin clip skid chop scan trap trim trip plod whip wrap repel beset besot begin demur strut strip strap squat
  )

  def gerundize
    word, rest = /(\w+)(.*)/.match(self).captures
    downcased = word.downcase
    if GERUND_DIRECT.include?(downcased)
      "#{word}ing"
    elsif word =~ /ing$/
      word
    elsif word =~ /(.*)ie$/
      "#{$1}ying"
    elsif word =~ /(.*)e$/
      "#{$1}ing"
    elsif GERUND_DOUBLES.include?(downcased)
      "#{word + word[-1,1]}ing"
    else
      "#{word}ing"
    end + rest
  end

  alias_method :to_gerund, :gerundize
end

class String
  include Gerundize
end

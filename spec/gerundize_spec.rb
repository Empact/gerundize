require File.dirname(__FILE__) + '/../lib/gerundize'

COMMON_FORM_LIST = {
      'submit' => 'submitting',
      'open' => 'opening',
      'add' => 'adding',
      'save' => 'saving',
      'update' => 'updating',
      'delete' => 'deleting',
      'erase' => 'erasing',
      'comment' => 'commenting',
      'push' => 'pushing',
      'follow' => 'following',
      'click' => 'clicking',
      'whack' => 'whacking'
    }

describe "#to_gerund" do
  # it_should_behave_like gerundize
  it "should translate common form submission words" do
    COMMON_FORM_LIST.each_pair do |key, value|
      key.to_gerund.should == value
    end
  end
end

describe "#gerundize" do
  it "should translate common form submission words" do
    COMMON_FORM_LIST.each_pair do |key, value|
      key.gerundize.should == value
    end
  end
  
  it "should generate the gerunds of dict/words from the other words thereof" do
    gerunds, nongerunds = `cat /usr/share/dict/words`.split.partition {|word| word =~ /ing$/ }
    total_gerund_count = gerunds.size
    
    nongerunds.each do |nongerund|
      gerunds.delete(nongerund.gerundize)
    end
    
    puts "#{gerunds.size} unmatched of #{total_gerund_count}"
    raise gerunds.reject {|word| word[-4, 1] != word[-5, 1] }.map {|word| word[0..-5] }.sort_by {|word| word.length }.inspect
    gerunds.should == []
    
    # 890 unmatched of 7162
    # "we", "ge", "te", "jib", "rid", "yuk", "ref", "rig", "yip", "rim", "rat", "rap", "yes", "rip", "yak", "ram", "win", "wig", "rag", "ban", "pup", "bat", "pun", "bed", "pud", "pub", "rob", "rot", "beg", "rug", "run", "pot", "pop", "Her", "rut", "pod", "bin", "pit", "wed", "pip", "bob", "web", "bog", "war", "bop", "pin", "bud", "bug", "fur", "wad", "bum", "vet", "cab", "vat", "can", "cap", "van", "pig", "sag", "pet", "pep", "pen", "peg", "pat", "par", "pap", "pan", "pad", "set", "sip", "sir", "nod", "nip", "nil", "nib", "net", "nap", "nag", "nab", "mug", "mob", "mar", "map", "cob", "cod", "sob", "col", "man", "lug", "lop", "tug", "sod", "con", "sop", "cop", "log", "lob", "lib", "let", "tre", "leg", "lap", "lam", "lag", "cum", "cun", "cup", "cur", "dab", "dam", "kne", "kid", "ken", "keg", "jut", "tot", "jug", "jog", "top", "job", "dig", "dim", "din", "dip", "tit", "tip", "tin", "tic", "jig", "dog", "rib", "don", "jet", "jam", "jab", "hug", "hop", "hip", "her", "hem", "hat", "gyp", "dub", "gut", "ear", "the", "rev", "gun", "tar", "tap", "gum", "sub", "sum", "fag", "fan", "tan", "fib", "fig", "tag", "fir", "gob", "tab", "gig", "fle", "gel", "zap", "gas", "sun", "sup", "fob", "fog", "fop", "gag", "gad", "gab", "wag", "swag", "swab", "swap", "swat", "swig", "swim", "flub", "flop", "flog", "flip", "swop", "flap", "glop", "glut", "flag", "abet", "grab", "abut", "grin", "grit", "stun", "grub", "agre", "stud", "aver", "wrap", "uner", "duel", "drum", "whop", "quiz", "quit", "quip", "pure", "drug", "drub", "drop", "stop", "thin", "stem", "drip", "stab", "whip", "drag", "whim", "whet", "prop", "prod", "prep", "wham", "bias", "spre", "plus", "plop", "plod", "plan", "blab", "blob", "brim", "scab", "scam", "thud", "spot", "dial", "scan", "scat", "unse", "chap", "char", "chef", "scud", "scum", "spin", "chin", "shag", "tram", "trap", "crop", "spec", "spar", "span", "crib", "crab", "sham", "trek", "chip", "skid", "omit", "trim", "trip", "trot", "twig", "twin", "twit", "coif", "club", "clot", "slum", "slug", "slop", "slog", "slip", "clop", "skim", "slim", "sled", "skin", "slap", "clog", "slam", "clod", "clip", "chum", "chug", "skip", "slab", "chop", "stub", "unfit", "unbar", "moral", "occur", "model", "local", "onset", "trial", "unman", "libel", "shrug", "shrub", "shred", "level", "label", "towel", "splat", "debar", "debug", "panel", "split", "decre", "scrub", "scrap", "unpin", "scram", "defer", "pedal", "cavil", "deter", "unwil", "unwit", "peril", "devil", "thrum", "jewel", "unzip", "phial", "upset", "carol", "donut", "japan", "throb", "dowel", "inter", "inset", "input", "infer", "bevel", "besot", "beset", "incur", "begin", "squab", "rowel", "impel", "beget", "befog", "squad", "befit", "imbed", "rivet", "squat", "squid", "strap", "rival", "strip", "strop", "strum", "strut", "embed", "equal", "anvil", "annul", "ravel", "allot", "rebel", "rebut", "gruel", "refer", "admit", "refit", "equip", "excel", "Schel", "revel", "rehab", "reset", "remit", "rerun", "repel", "nutmeg", "zigzag", "acquit", "wigwag", "barrel", "bestir", "bushel", "regret", "refuel", "verbal", "cancel", "catnap", "refere", "unwrap", "ramrod", "caucus", "pummel", "propel", "caveat", "preset", "prefer", "prefab", "russet", "pommel", "unstop", "unsnap", "unplug", "permit", "unflag", "pencil", "patrol", "parcel", "chisel", "chorus", "overse", "combat", "commit", "outwit", "compel", "tunnel", "shovel", "confab", "trowel", "outset", "outrun", "confer", "corral", "costar", "signal", "output", "outfit", "cravat", "offset", "travel", "cudgel", "disbar", "hostel", "drivel", "tassel", "enamel", "entrap", "mishap", "misfit", "marvel", "swivel", "snivel", "forbid", "forese", "format", "logrol", "funnel", "gambol", "suntan", "sunset", "gossip", "spiral", "kidnap", "kennel", "gravel", "grovel", "gunrun", "hiccup", "humbug", "hobnob", "tinsel", "reoccur", "airdrop", "squeege", "stencil", "impanel", "apparel", "handbag", "babysit", "backlog", "haircut", "imperil", "worship", "initial", "woodcut", "wiretap", "kneecap", "wildcat", "lateral", "leaflet", "remodel", "surplus", "spaniel", "relabel", "foxtrot", "bayonet", "manumit", "snorkel", "marshal", "bedevil", "flannel", "overlap", "benefit", "misstep", "bobsled", "monolog", "teargas", "bootleg", "bulldog", "victual", "refocus", "dogtrot", "readmit", "quarrel", "program", "sandbag", "chagrin", "disagre", "diagram", "unremit", "deadpan", "trammel", "nonplus", "transit", "unravel", "channel", "chirrup", "reparte", "outcrop", "sightse", "periwig", "copycat", "control", "typeset", "shrivel", "overrun", "shotgun", "filigre", "shortcut", "outstrip", "squirrel", "overstep", "underbid", "undercut", "underpin", "chitchat", "parallel", "sidestep", "crossbar", "handicap", "pettifog", "transmit", "hairdres", "guarante", "subtotal", "garnishe", "leapfrog", "dishevel", "disinter", "doorstep", "uppercut", "backstab", "carillon", "ricochet", "reformat", "flimflam", "backstop", "bullshit", "earsplit", "wainscot", "fricasse", "monogram", "blacktop", "resubmit", "lollygag", "retrofit", "sidesplit", "eavesdrop", "mousetrap", "carpetbag", "Photostat", "reprogram", "backpedal", "horsewhip", "transship", "nightclub", "deprogram", "hairsplit", "jitterbug", "featherbed", "disembowel", "multiproces", "phototypeset"
  end
end
